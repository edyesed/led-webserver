#!/bin/sh

# A client to set random colors every few seconds

RUNS=0
while true; do
  COLOR=`shuf -i 4-255 -n 1`
  curl -XPOST http://localhost:5000/color/${COLOR}
  ((RUNS=RUNS+1))
  if [ $RUNS -ge 3 ]; then
     RUNS=0
     sleep 3;
  fi
done
