# MAC_Spoofer


MAC_Spoofer is a Bash script tool designed to spoof the MAC address of any network interface (wired or wireless). Use it to bypass Network Access Control(NAC) in Active Directory(AD) environments, enhance privacy, and test networks with ease.

---

## Features
- Change the MAC address to a specific value or randomize it.
- Supports wired (`eth0`) and wireless (`wlan0`) interfaces.
- Temporary changes reset on reboot.

---

## Installation
1. Clone the repository:
```
git clone https://github.com/yourusername/macspoofer.git
cd mac_spoofer
```


2. Make the script executable:
```
chmod +x mac_spoofer.sh
```

3. Install `macchanger`:

```
sudo apt update && sudo apt install macchanger
```
---

## Usage
Run the script with root privileges:

```
sudo ./mac_spoofer.sh <interface> <new_mac_address>
```

### Examples:
- Set a specific MAC for `eth0`:
```
sudo ./mac_spoofer.sh eth0 EC:C0:18:D3:28:34
```

- Randomize the MAC for `wlan0`:
```
sudo ./mac_spoofer.sh wlan0 AA:BB:CC:DD:EE:FF
```

---

## Limitations
- Changes are temporary and reset after reboot.
- Some drivers/hardware may block MAC spoofing.
- NetworkManager may override changes unless stopped.

---

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
