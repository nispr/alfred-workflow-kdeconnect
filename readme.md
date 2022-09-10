# alfred-workflow-kdeconnect

An Alfred Workflow to control **[KDEConnect](https://community.kde.org/KDEConnect)**, providing:

- sending files to a mobile device
- letting phone ring (find my device)

## Commands

- `kring` lets your device ring
- `kshare {filename}` shares the specified file with the device. Also useful for Universal Actions.

## Connecting

- If you're already connected to a device, the workflow will use the first connected device.
- If you're not connected to a device, the workflow will try to connect with the first available device on your network.

## Connectivity issues
- I faced daemon issues on an M1 Mac, so I've written a tiny script [here](https://gist.github.com/nispr/1a7afae1b7b58a91fc8e792edfda6ead) to actually _start_ the daemon and secondly to prevent random daemon outages. 

## Disclaimer

This is heavily untested, WIP and might be poorly implemented.
