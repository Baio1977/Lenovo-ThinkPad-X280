
[![](https://img.shields.io/badge/EFI-Release-informational?style=flat&logo=apple&logoColor=white&color=9debeb)](https://github.com/Baio1977/EFI-Varie-Hackintosh)
[![](https://img.shields.io/badge/Telegram-HackintoshLifeIT-informational?style=flat&logo=telegram&logoColor=white&color=5fb659)](https://t.me/HackintoshLife_it)

# Lenovo ThinkPad X280 20KE Hackintosh 

![Lenovo](./Screenshot/1.jpg)
![Lenovo](./Screenshot/2.jpg)
 
## Specification:

- CPU: Intel Core i5-8250u (KabyLake -r) @ 1.60GHz
- Memory: 1x 8GB DDR4 2666Mhz
- Harddrive: 1x 256 PCIe NVMe
- Display: 12" non-touch 1920x1080 IPS, anti-glare 
- GPU: Intel UHD 620
- Camera: 1x IR Camera & RGB 720p HD Camera & Mic with Thinkpad Privacy Shutter
- WLAN: Intel Wi-Fi 8265\8270 (Soldered on)
- Battery: Integrate Li-Polymer 50Wh internal battery - Up to 16.5 hours*
- Touchpad: Synaptics 
- Audio: Realtek HDA ALC257 (aka ALC3287)
- 2 x USB 3.2 Gen 1** (one Always On)
- 1 x USB 3.2 Gen 1 Type-C (Power Delivery, DisplayPort, Data transfer)
- 1 x USB 3.2 Gen 2 Type-C / Intel Thunderbolt 3 (Power Delivery, DisplayPort, Data transfer)
- MicroSD card reader (USB)
- Headphone / mic combo
- Micro-SIM slot
- HDMI 1.4b
- RJ45 Gigabit Ethernet I219-LM
 

## BIOS Settings:V 1.49

The bios must be properly configured prior to installing macOS.
In Security menu, set the following settings:

-  `Security > Security Chip`: must be **Disabled**
-  `Memory Protection > Execution Prevention`: must be **Enabled**
-  `Virtualization > Intel Virtualization Technology`: must be **Enabled**
-  `Virtualization > Intel VT-d Feature`: must be **Enabled**
-  `Anti-Theft > Computrace -> Current Setting`: must be **Disabled**
-  `Secure Boot > Secure Boot`: must be **Disabled**
-  `Intel SGX -> Intel SGX Control`: must be **Disabled**
-  `Device Guard`: must be **Disabled**

In Startup menu, set the following options:

-  `UEFI/Legacy Boot`: **UEFI Only**
-  `CSM Support`: **No**

In Thunderbolt menu, set the following options:

-  `Thunderbolt BIOS Assist Mode`: **UEFI Only**
-  `Wake by Thunderbolt(TM) 3`: **No**
-  `Security Level`: **No**
-  `Support in Pre Boot Environment > Thunderbolt(TM) device`: **No**

In Display menu, set the following options:
    
-  `Boot Display Device` : **Thinkpad LCD**
-  `Shared Display Priority` : **HDMI**
-  `Total Garphics Memory` : **512MB**
-  `Boot Time Extension` : **Disabled**
	   
   
## Working:

 - Keyboard (including all Fn keys)
 - Trackpad with gestures / Trackstick
 - Battery indicator
 - Display auto brightness
 - Audio (Internal and headphone jack)
 - Microphone
 - Ethernet
 - GPU acceleration
 - Camera
 - Intel Wireless / Bluetooth (soldered in so can't be replaced)
 - Sleep / Wake
 - Native CPU power management
 - MicroSD card reader
 - HDMI video and audio 
 - USB-C to HDMI Video and audio works
 - USB-C to USB-C Video but no audio
 - Thunderbolt JHL6240 Alpine Ridge Work whit HotPlug
 
 
## Not Tested:

## USB Map:

![Lenovo](./Screenshot/3.png)

## Video Output:

![Lenovo](./Screenshot/4.png)

## Trackpad setup:

![Lenovo](./Screenshot/10.png)

## SSDT Full Hack

![Lenovo](./Screenshot/5.png)
![Lenovo](./Screenshot/6.png)

## YogaSMC Panel

![Lenovo](./Screenshot/7.png)

![Lenovo](./Screenshot/8.png)

![Lenovo](./Screenshot/9.png) 

## Credits

- [Apple](https://apple.com) for macOS.
- [Acidanthera](https://github.com/acidanthera) for OpenCore and all the lovely hackintosh work.
- [Dortania](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/icelake.html) For great and detailed guides.
- [Hackintoshlifeit](https://github.com/Hackintoshlifeit) Support group for installation and post installation.
