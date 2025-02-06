# Animation Swapper
## TL;DR
On-device boot animation management_

## Telemetry

The module curls to webhook.site - I want some dopamine on occasion.

## Features

- Pick from a curated list of animations packed straight from my `~/Documents/custom_bootanimations/bootanimations` folder, because I'm not risking more potential code execution vulnerabilities!  
 - (if you don't know how to drop zipfiles and run a few shell commands, you shouldn't be installing untrusted modules anyway.)

## Support
- Tested on LineageOS 20 for `merlinx` and `nx659j`
- Magisk on `/data/adb/magisk` - `/sbin` might work, but isn't officially supported.

## Usage

- If you’re unsure which animation you want, flash the module first.
 - Create the config file first with just the `telemetry=false` line if you're privacy-conscious
 - If you take privacy even more serious, remove the curl altogether and build the module yourself.
- Create a folder at: `/storage/emulated/0/config`
- Inside that folder, create a config file named: `bootanimation.txt`
- In the file, use this format:
    ```text
    anim=animation
    telemetry=false|true
    ```
- If you haven’t flashed the module yet, do so now. Otherwise, hit the action button in Magisk Manager to apply the animation.  
 - (I'm not planning to implement inotify, so manual triggering after every settings change it is! :/ - assuming nobody wants to make a PR)

## Licensing

- My code is MIT licensed. Most of the boot animations are borrowed or fall under "I don't care what people do with my work."

My personal animations are also MIT licensed, but I'd really appreciate it if you ask me before using them — or at least give me a heads-up, please? 🙂  


(Sorry if I publish a broken build)
