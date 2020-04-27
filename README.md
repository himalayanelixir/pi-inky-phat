# Pi Inky pHAT
<!-- vscode-markdown-toc -->
* [Summary](#Summary)
* [Installation](#Installation)
	* [Existing Image](#ExistingImage)
	* [New Image](#NewImage)
* [Using display.py](#Usingdisplay.py)

<!-- vscode-markdown-toc-config
	numbering=false
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

## <a name='Summary'></a>Summary

The Inky pHAT and Inky wHAT are eink displays made by Pimoroni (<https://bit.ly/2xTrfHB>). I like using them to test thing when developing programs on the Raspberry Pi. Though the screens are nice, the installation process is a pain, takes a long time, and isn't automated.

![Diagram](https://raw.githubusercontent.com/himalayanelixir/pi-inky-phat/master/docs/pi-inky-phat.jpg)
<p align="center"><i>Raspberry Pi 3 with Inky pHAT</i></p>

## <a name='Installation'></a>Installation

### <a name='ExistingImage'></a>Existing Image

If you are already using a Raspberry Pi I would recommend using the ```inky-phat-installer.sh``` script. Running this you'll get a minimal install of the Inky pHAT drivers. Once the script has run you will see the current time in UTC on the Inky pHAT display.

### <a name='NewImage'></a>New Image

If you are creating a fresh image for a Raspberry Pi, using the Firstboot Raspbian Image is the way to go as you can have everything ready to go when you first login into the Raspberry Pi.

The best way to get everything working properly is to follow these steps:

1. Download the latest image from <https://github.com/nmcclain/raspberian-firstboot/releases>
2. Use etcher to write to the SD card (<https://www.balena.io/etcher/>)
3. Copy over ```image-setup/firstboot.sh``` and ```image-setup/wpa_supplicant.conf``` to boot partition of SD card. Remember to edit the `wpa_supplicant.conf` file with the details for your wifi network
4. Put the SD card into Raspberry Pi and boot. This will take a while but but shouldn't take more than 20 mins. If it does something probably went wrong.
5. Once the script has run you will see the current time in UTC on the Inky pHAT display.

## <a name='Usingdisplay.py'></a>Using display.py

Using either of the two methods above will download a program called display.py into the ```/home/pi``` directory. You can use this program to send strings to the Inky pHAT display.

For example, `python3 /home/pi/display.py hello` will print ```hello``` on the Inky pHAT display.
