PROGRAM main
  VAR
    liga : BOOL AT %IX0.0;
    desliga : BOOL AT %IX0.1;
    saida : BOOL AT %QX0.0;
  END_VAR

saida := (liga OR saida) AND NOT desliga;


END_PROGRAM