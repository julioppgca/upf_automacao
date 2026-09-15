// Headless bridge: loads a compiled "OpenPLC Simulator" (.hex, ATmega2560)
// firmware into the in-process avr8js emulator and exposes its emulated UART
// as raw bytes over a local TCP socket, so an external Modbus RTU client
// (e.g. pymodbus with an RTU framer) can talk to it as if it were a
// serial-to-Ethernet gateway. Point-to-point only: one active connection at
// a time, matching a real RS-232/RS-485 line.
//
// Polls the .hex file's mtime and reloads the emulator whenever it changes
// (i.e. every time you rebuild the project in OpenPLC Editor) — otherwise
// editing the ladder would silently keep running the old compiled program
// forever, since nothing else here ever looks at the file again.

import { createServer, type Socket } from 'node:net'
import { readFileSync, statSync } from 'node:fs'

import { SimulatorModule } from './simulator-module'

function usage(): never {
  console.error('usage: sim-bridge <path-to-firmware.hex> [tcp-port=8502] [poll-interval-ms=1000]')
  process.exit(1)
}

const hexPath = process.argv[2]
const port = Number(process.argv[3] ?? 8502)
const pollIntervalMs = Number(process.argv[4] ?? 1000)
if (!hexPath || Number.isNaN(port) || Number.isNaN(pollIntervalMs)) usage()

const sim = new SimulatorModule()
let activeSocket: Socket | null = null

// Re-attached after every load/reload — loadAndRun() calls stop() internally,
// which nulls onUartByte, so a callback set only once at startup would go
// silent on the very first reload.
function attachUartBridge(): void {
  sim.onUartByte = (byte: number) => {
    activeSocket?.write(Buffer.from([byte]))
  }
}

function loadFirmware(path: string): void {
  const hexContent = readFileSync(path, 'utf8')
  sim.loadAndRun(hexContent)
  attachUartBridge()
}

loadFirmware(hexPath)
console.log(`[sim-bridge] firmware loaded from ${hexPath}, emulator running`)

let lastMtimeMs = statSync(hexPath).mtimeMs
setInterval(() => {
  let stat
  try {
    stat = statSync(hexPath)
  } catch {
    return // mid-rebuild, file briefly missing/locked — try again next poll
  }
  if (stat.mtimeMs === lastMtimeMs) return
  lastMtimeMs = stat.mtimeMs
  try {
    loadFirmware(hexPath)
    console.log(`[sim-bridge] firmware changed on disk — reloaded (program restarted from power-on)`)
  } catch (err) {
    console.error('[sim-bridge] reload failed, keeping previous firmware running:', err)
  }
}, pollIntervalMs)

const server = createServer((socket) => {
  if (activeSocket) {
    console.warn('[sim-bridge] refusing extra connection — one active client already')
    socket.destroy()
    return
  }

  activeSocket = socket
  console.log(`[sim-bridge] client connected: ${socket.remoteAddress}:${socket.remotePort}`)

  socket.on('data', (chunk: Buffer) => {
    for (const byte of chunk) sim.feedByte(byte)
  })

  const cleanup = () => {
    if (activeSocket === socket) activeSocket = null
  }
  socket.on('close', cleanup)
  socket.on('error', (err) => {
    console.error('[sim-bridge] socket error:', err.message)
    cleanup()
  })
})

server.listen(port, () => {
  console.log(`[sim-bridge] listening on tcp://127.0.0.1:${port} (raw Modbus RTU byte stream)`)
})

process.on('SIGINT', () => {
  console.log('\n[sim-bridge] shutting down')
  sim.stop()
  server.close(() => process.exit(0))
})
