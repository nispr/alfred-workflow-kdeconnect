#!/usr/bin/env bash

source ./parse_device_id.sh

deviceList=$1
if [ -z "$deviceList" ]; then
  >&2 echo "Device list is required to connect first device"
fi

result=0
reachables=$(echo $deviceList | grep "reachable" -m 1)
sanitized=$(sanitize_device_entry "$reachables")
deviceId=$(parse_device_id "$sanitized")
if [ -z "$deviceId" ]; then
    # Something went wrong parsing
    result=1
else
    msg=$($kdeconnect -d $deviceId --pair)
    result=$?
    if [[ result -eq 0 ]]; then
        # Auto-connected
        echo -n $(parse_device_name "$sanitized")
    fi
fi

exit $result
