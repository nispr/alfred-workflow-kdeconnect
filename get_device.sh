  #!/bin/bash
  source ./parse_device_id.sh

  # We could use kdeconnect-cli -a which SHOULD give us all paired devices, but it seems buggy
  # (it also delivers unpaired devices, so grep manually)

  if [ -z "$kdeconnect" ] 
  then
    >&2 echo "path to kdeconnect-cli must be set"
    exit 1
  fi

  if [ -z "$1" ]
  then
    >&2 echo "Device list is required to get connected device"
    exit 1
  fi

  deviceList=$1
  result=0
  indicator='paired and reachable'
  verboseDevice=$(echo $deviceList | grep "$indicator" -m 1)
  sanitized=$(sanitize_device_entry "$verboseDevice")
  deviceId=$(parse_device_id "$sanitized")

  if [ -n "$deviceId" ]
  then
    # Connected already
    echo -n $deviceId
  else 
    >&2 echo "Something went wrong: Device list '$deviceList' verboseDevice '$verboseDevice' San '$sanitized' id '$deviceId'"
  fi

  exit $result