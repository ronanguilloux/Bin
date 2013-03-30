This conf was checked OK on a 2013-02-09-wheezy-raspbian.img distro 
writted on a 4Go SD-CARD
with a Wifi dongle: D-Link System DWA-131 802.11n Wireless N Nano Adapter(rev.A1) [Realtek RTL8192SU]

Easy detailled SD Card setup: http://elinux.org/RPi_Easy_SD_Card_Setup 

Plug the RJ45 connector (wifi conf is setted up later in this file)

From a remote SSH client, find out where is the raspberry pi in the LAN
(openssh server is enabled by default)

    sudo nmap -sV --open 192.168.0.0/25 -p22

SSH on the raspi

    ssh pi@[RASPBERRY.PI.IP]

Use default `pi` password: `rasperry`

    sudo raspi-config

* update raspi-config
* expand root FS (then reboot)
* set locale
* set timezone
* configure AZERTY keyboard, 
* change memory split: give only 16 Mo to the GPU (we use raspi as a server)

Add a personal Linux user login

    sudo adduser myLogin

Set it as a sudoer

    sudo visudo

And then add (under pi):

    myLogin ALL=(ALL) NOPASSWD: ALL

then CTRL+O to save & CTRL+X to exit from nano editor 
(or CTRL+K then CTRL+X to save & exit from joe)

Then exit & re-connect via ssh using myLogin

Linux upgrade

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade
    sudo apt-get install vim

Wifi: device check

    lsusb

The D-Link System DWA-131 802.11n Wireless N Nano Adapter(rev.A1) [Realtek RTL8192SU]
has been tested OK on a 2013-02-09-wheezy-raspbian.img ISO distro
with the following configuration.

This command should return various WIFI networks around you:

    sudo iwconfig scanning

Wifi: interfaces

    sudo /etc/network/interfaces

Content should be: 

    auto lo

    iface lo inet loopback
    iface eth0 inet dhcp

    allow-hotplug wlan0
    auto wlan0
    iface wlan0 inet dhcp
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

Wifi: WPA conf

    sudo /etc/wpa_supplicant/wpa_supplicant.conf

Content should be: 

    ctrl_interface=/var/run/wpa_supplicant 
    update_config=1
    network={
        ssid="WIFI_NETWORK_NAME"
        proto=WPA
        key_mgmt=WPA-PSK
        pairwise=CCMP TKIP
        group=CCMP TKIP
        psk="WIFI_PASSWORD"
    }

Then unplug the RJ45 connector & reboot 

To retrieve the raspi in the network:

    sudo nmap -sV --open 192.168.0.0/25 -p22

Now you can ssh using your myLogin you just setted up 

    ssh myLogin@[RASPBERRY.PI.IP]

Installing essential command-line based tools

    sudo apt-get install curl tree htop mailutils fortunes-fr vrms linuxlogo sysstat di discus pydf hardinfo lynx ack-grep pandoc most exuberant-ctags build-essential manpages-fr manpages-fr-dev manpages-fr-extra  git git-core git-email git-doc tig markdown xclip p7zip-full analog cloc tidy

Dev tools & servers

    sudo apt-get install imagemagick php5 php5-dev php-apc php5-xdebug php5-mysql php5-sqlite php5-cli php5-curl php-pear php5-common php5-mcrypt php5-ps php5-pspell php5-tidy php5-intl php5-gd php5-imagick php5-imap php5-xsl php5-memcache php5-recode php5-snmp php-geshi apache2 apache2-mpm-prefork libapache2-mod-php5 apache2-utils mysql-server phpmyadmin

Adding current user to www-data group

    sudo adduser $LOGNAME www-data

Copy your `.ssh/id_rsa.pub` local key on the raspi in a `.ssh/authorized_keys` file

Generate new ssh-keys for raspi : https://help.github.com/articles/generating-ssh-keys

Then mount the usb key :

First list the found devices

    lsusb

    sudo fdisk -l

Find out your device address (by example: sda1), then mount it:

    sudo mkdir /media/usb

    sudo chown myLogin:MyGroup /media/usb

    sudo chmod 644 /media/usb

    sudo vim /etc/fstab

Add the line :

    /dev/sda1 /media/usb vfat rw,defaults,uid=myLogin,gid=MyGroup 0 0

…where `myGroup` & `myLogin` are usually the same : your user login on the machine.

Then mount it (will always be mounted after that)

    sudo mount -a

OK, at this point we need a disk space usage overview :

    df -h

Set up git

    git config --global user.name "Your Name Here"
    git config --global user.email "your_email@example.com"

Install dotfiles (will conserve existing conf)

    git clone git@github.com:ronanguilloux/dotfiles.git
    dotfiles/install.sh

PHP-quality related tools (see http://phpqatools.org/)
will install phpunit, phploc, phpcpd, phpcs, pdepend, phpmd, PHP_CodeBrowser, phpdcd

    sudo pear config-set auto_discover 1
    sudo pear install pear.phpqatools.org/phpqatools

Apache2 mods

    sudo a2enmod rewrite
    sudo a2enmod headers
    sudo a2enmod deflate
    sudo a2enmod expires
    sudo a2enmod setenvif
    sudo service apache2 restart



