# alfred-workflow-kdeconnect

An Alfred Workflow to control **[KDEConnect](https://community.kde.org/KDEConnect)** (heavily WIP),
providing the following basic functionality:

- sending files to a mobile device
- letting phone ring (find my device)

## Commands
- `kring` lets your device ring
- `kshare {filename}` shares the specified file with the device. Also useful for Universal Actions. 

## Install
- Make sure [KDEConnect is installed](https://kdeconnect.kde.org/download.html).
- Run `make` (`brew install make`)
- Open the generated `alfred-workflow-kdeconnect.alfredworkflow` file
- Set the `kdeconnect` Workflow Environment Variable to the KDEConnect CLI path.
  It is bundled with KDEConnect, `/Applications/kdeconnect-indicator.app/Contents/MacOS/kdeconnect-cli` by default.

## Connecting
- If you're already connected to a device, the workflow will use the first connected device.
- If you're not connected to a device, the workflow will try to connect with the first available device on your network.

## Issues
I'm not sure if KDEConnect is a very reliable utility, at least on M1 Macs. 
And unfortunately, this workflow can only be as reliable as the CLI allows it to be.

- I faced daemon issues on an M1 Mac, so I've written a tiny script [here](https://gist.github.com/nispr/1a7afae1b7b58a91fc8e792edfda6ead) to actually _start_ the KDE daemon (it doesn't seem to start reliably with the GUI) and secondly to prevent random daemon outages. 
- Sometimes the KDEConnect CLI seems to fail silently, or the command gets lost in transit.

## Disclaimer

This is heavily untested, WIP and might be poorly implemented.
