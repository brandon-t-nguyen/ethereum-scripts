#!/bin/bash

trap sigint_handler INT

function sigint_handler() {
    echo "Caught SIGINT";
    pkill ethminer
    exit 0
}

ETHER_ADDR=0xDd9d279854C8D614d37a492192A40f678f476BC1
SERVER1=us1.ethermine.org:4444
SERVER2=us2.ethermine.org:4444

DUTY=100
FULL_TIME=600
if  [ "$#" -ge 1 ]; then
    DUTY=$1
fi

if  [ "$#" -ge 2 ]; then
    FULL_TIME=$2
fi

ON_TIME=$((FULL_TIME * DUTY / 100))
OFF_TIME=$((FULL_TIME - ON_TIME))



echo "Cycle time: $FULL_TIME seconds";
echo "On time : $ON_TIME seconds";
echo "Off time: $OFF_TIME seconds";
echo "Duty cycle: $DUTY%";

while true; do
    pkill ethminer
    ethminer    --farm-recheck 200 -RH -X -S $SERVER1 -FS $SERVER2 -O $ETHER_ADDR.$(hostname) --opencl-platform 1 &
    sleep $ON_TIME
    pkill ethminer
    ethminer    --farm-recheck 200 -RH -U -S $SERVER1 -FS $SERVER2 -O $ETHER_ADDR.$(hostname) &
    sleep $OFF_TIME
done
