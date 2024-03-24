#!/bin/bash

conncection_status=$(bluetoothctl info F0:D3:1F:87:3F:9E | grep Connected | awk '{print $2}')

if [[ $conncection_status == "yes" ]]; then
  bluetoothctl disconnect F0:D3:1F:87:3F:9E
else
  bluetoothctl connect F0:D3:1F:87:3F:9E
fi
