#!/bin/sh

wget https://download.lenovo.com/servers/mig/2020/10/16/32875/lnvgy_utl_bootstor_sata.mvcli-2.3.10.1095-0_linux_x86-64.tgz
tar -xvzf lnvgy_utl_bootstor_sata.mvcli-2.3.10.1095-0_linux_x86-64.tgz
sudo cp lnvgy_utl_bootstor_sata.mvcli-2.3.10.1095-0_linux_x86-64/mvcli /usr/local/bin
sudo chmod 755 /usr/local/bin/mvcli
sudo cp lnvgy_utl_bootstor_sata.mvcli-2.3.10.1095-0_linux_x86-64/libmvraid.so /lib
