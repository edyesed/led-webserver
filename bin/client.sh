#!/bin/sh

IS_RUNNING=`ps -aef | grep sh.*client.sh | grep -v grep | awk '{print $2}' | grep -v $$`
if [[ ! -z ${IS_RUNNING} ]]; then
   kill ${IS_RUNNING}
fi

# A client to set random colors every few seconds

RUNS=0

while true; do
  RED=0
  GREEN=0
  BLUE=0

  if [[ $# == 0 ]]; then
    COLOR=`shuf -i 4-255 -n 1`
    curl -s -XPOST http://localhost:5000/color/${COLOR}
    ((RUNS=RUNS+1))
    if [ $RUNS -ge 3 ]; then
       RUNS=0
       echo ""
       sleep 3;
    fi
  else
    if [[ "$1" == "red" ]]; then
       RED=`shuf -i 4-255 -n 1`
    elif [[ "$1" == "green" ]]; then
       GREEN=`shuf -i 4-255 -n 1`
    elif [[ "$1" == "blue" ]]; then
       BLUE=`shuf -i 4-255 -n 1`
    fi
    curl -s -XPOST http://localhost:5000/color/${RED}
    curl -s -XPOST http://localhost:5000/color/${GREEN}
    curl -s -XPOST http://localhost:5000/color/${BLUE}
    echo ""
    sleep 3;
    curl -s -XPOST http://localhost:5000/color/0
    curl -s -XPOST http://localhost:5000/color/0
    curl -s -XPOST http://localhost:5000/color/0
  fi

done
