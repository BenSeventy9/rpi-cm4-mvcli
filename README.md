# Install instructions and how to use mvcli(x64) on arm64 with box64
## Hardware
- Raspberry Pi CM4 and IO Board with PCIE Connector
- Marvell® 88SE9220/9230 PCIe to SATA 6Gb/s Controllers RAID 0/1/10 HyperDuo
- Tested: 88SE9230
- Untested: 88SE9220
## Requirements
- git
- build-essential
- cmake
```
sudo apt install git build-essential cmake
```
## Box64 install instructions
Based on original instructions: https://github.com/ptitSeb/box64/blob/main/docs/COMPILE.md#for-pi4

Warning, you need a 64bit OS:

```
git clone https://github.com/ptitSeb/box64
cd box64
mkdir build; cd build; cmake .. -DRK3399=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j4
sudo make install
```
If it's the first install, you also need:
```
sudo systemctl restart systemd-binfmt
```
## Mvcli install and usage instructions
## Solution 1 WITH shell mode support:
- Found here: https://www.dell.com/support/home/de-ch/drivers/driversdetails?driverid=67hr5
### Install:
```
wget https://dl.dell.com/FOLDER04572610M/1/mvcli%204.1.13.31_A01.zip
unzip 'mvcli 4.1.13.31_A01.zip'
sudo cp 'mvcli 4.1.13.31_A01'/x64/cli/mvcli /usr/local/bin
sudo chmod 755 /usr/local/bin/mvcli
sudo cp 'mvcli 4.1.13.31_A01'/x64/cli/libmvraid.so /lib
```
### Usage:
Run:
```
sudo BOX64_PATH=/usr/local/bin BOX64_LD_LIBRARY_PATH=/lib mvcli
```
Output:
```
~ $ sudo BOX64_PATH=/usr/local/bin BOX64_LD_LIBRARY_PATH=/lib mvcli
Dynarec for ARM64, with extension: ASIMD CRC32 PageSize:4096
Box64 with Dynarec v0.1.9 a3f63a1 built on Sep  6 2022 13:48:14
BOX64_LD_LIBRARY_PATH: /lib/
BOX64_PATH: /bin/
Counted 16 Env var
Looking for /usr/local/bin/mvcli
Rename process to "mvcli"
Using emulated /lib/libmvraid.so
Using native(wrapped) libpthread.so.0
Using native(wrapped) libdl.so.2
Using native(wrapped) libc.so.6
Using native(wrapped) ld-linux-x86-64.so.2
Using native(wrapped) librt.so.1
Using emulated /lib/x86_64-linux-gnu/libstdc++.so.6
Using native(wrapped) libm.so.6
Using emulated /lib/x86_64-linux-gnu/libgcc_s.so.1
SG driver version 3.5.36.
CLI Version: 4.1.13.31   RaidAPI Version: 5.0.13.1071
Welcome to RAID Command Line Interface.

>
```
Help command:
```
help
```
Output:
```
> help

Legend:
  [options] - the options within [] are optional.
  <x|y|z>   - choose one of the x, y or z.
  [<x|y|z>] - choose none or one of the x, y or z.

Abbreviation:
    VD  - Virtual Disk,   Array  - Disk Array
    PD  - Physical Disk,  BGA - BackGround Activity

Type '-output [filename]' to output to a file.
Type 'help' to display this page.
Type 'help command' to display the help page of 'command'.
Type 'command -h' to display help for 'command'.

Command name is not case sensitive and may be abbreviated if the
abbreviation is unique. Most commands support both short (-) and
long (--) options.Long option names may be abbreviated if the abbreviation
is unique. A long option may take a parameter of the form '--arg=param'
or '--arg param'. Option name is case sensitive, option parameter is not.

COMMAND   BRIEF DESCRIPTION
-----------------------------------------------------------------
?            :Get brief help for all commands.
help         :Get brief help for all commands or detail help for one command.
rebuild      :Start, stop, pause, resume rebuilding VD.
smart        :Display the smart info of physical disk.
flash        :Update, backup or erase flash image and erase hba or pd page.
enc          :Get enclosure, enclosure element or enclosure config information.
adapter      :Default adapter the following CLI commands refers to.
create       :Create virtual disk.
delete       :Delete virtual disk or spare drive.
event        :Get the current events.
get          :Get configuration information of VD, PD, Array, HBA or Driver.
info         :Display adapter(hba), virtual disk(vd), disk array,
              physical disk(pd), Port multiplexer(pm), expander(exp),
              block disk(blk) or spare drive information.
set          :Set configuration parameters of VD, PD or HBA.
import       :Import a virtual disk.
locate       :Locate the specified PD.
report       :report a conflicted virtual disk to OS.
devmap       :Map device ID to device magic number in the OS.

>
```
This command is also possible if you don't need shell mode support:
```
sudo BOX64_PATH=/usr/local/bin BOX64_LD_LIBRARY_PATH=/lib mvcli help
```
## Solution 2 WITHOUT shell mode support:
- Found here: https://datacentersupport.lenovo.com/nz/en/downloads/DS547073
### Install:
```
wget https://download.lenovo.com/servers/mig/2020/10/16/32875/lnvgy_utl_bootstor_sata.mvcli-2.3.10.1095-0_linux_x86-64.tgz
tar -xvzf lnvgy_utl_bootstor_sata.mvcli-2.3.10.1095-0_linux_x86-64.tgz
sudo cp lnvgy_utl_bootstor_sata.mvcli-2.3.10.1095-0_linux_x86-64/mvcli /usr/local/bin
sudo chmod 755 /usr/local/bin/mvcli
sudo cp lnvgy_utl_bootstor_sata.mvcli-2.3.10.1095-0_linux_x86-64/libmvraid.so /lib
```
### Usage:
Run:
```
sudo BOX64_PATH=/usr/local/bin BOX64_LD_LIBRARY_PATH=/lib mvcli help
```
Output:
```
~ $ sudo BOX64_PATH=/usr/local/bin BOX64_LD_LIBRARY_PATH=/lib mvcli help
Dynarec for ARM64, with extension: ASIMD CRC32 PageSize:4096
Box64 with Dynarec v0.1.9 a3f63a1 built on Sep  6 2022 13:48:14
BOX64_LD_LIBRARY_PATH: /lib/
BOX64_PATH: /usr/local/bin/
Counted 16 Env var
Looking for /usr/local/bin/mvcli
argv[1]="help"
Rename process to "mvcli"
Using emulated /lib/libmvraid.so
Using native(wrapped) libpthread.so.0
Using native(wrapped) libdl.so.2
Using native(wrapped) libc.so.6
Using native(wrapped) ld-linux-x86-64.so.2
Using native(wrapped) librt.so.1
Using emulated /lib/x86_64-linux-gnu/libstdc++.so.6
Using native(wrapped) libm.so.6
Using emulated /lib/x86_64-linux-gnu/libgcc_s.so.1
SG driver version 3.5.36.

Legend:
  [options] - the options within [] are optional.
  <x|y|z>   - choose one of the x, y or z.
  [<x|y|z>] - choose none or one of the x, y or z.

Abbreviation:
    VD  - Virtual Disk,   Array  - Disk Array
    PD  - Physical Disk,  BGA - BackGround Activity

Type '-output [filename]' to output to a file.
Type 'help' to display this page.
Type 'help command' to display the help page of 'command'.
Type 'command -h' to display help for 'command'.

Command name is not case sensitive and may be abbreviated if the
abbreviation is unique. Most commands support both short (-) and
long (--) options.Long option names may be abbreviated if the abbreviation
is unique. A long option may take a parameter of the form '--arg=param'
or '--arg param'. Option name is case sensitive, option parameter is not.

COMMAND   BRIEF DESCRIPTION
-----------------------------------------------------------------
?            :Get brief help for all commands.
help         :Get brief help for all commands or detail help for one command.
rebuild      :Start, stop, pause, resume rebuilding VD.
smart        :Display the smart info of physical disk.
flash        :Update or backup flash image or pd page.
enc          :Get enclosure, enclosure element or enclosure config information.
locate       :Locate the specified PD.
forceonline  :Forceonline the physical disk
adapter      :Default adapter the following CLI commands refers to.
create       :Create virtual disk.
delete       :Delete virtual disk or spare drive.
event        :Get the current events.
get          :Get configuration information of VD, PD, Array, HBA or Driver.
info         :Display adapter(hba), virtual disk(vd), disk array,
              physical disk(pd), Port multiplexer(pm), expander(exp),
              block disk(blk) or spare drive information.
set          :Set configuration parameters of VD, PD or HBA.
import       :Import a virtual disk.
devmap       :Map device ID to device magic number in the OS.
pdflash      :Update disk fiwmware.

~ $
```
