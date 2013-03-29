
Find out where is the raspberry pi in the LAN

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

Linux upgrade

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade


Essential command-line based tools

    sudo apt-get install curl tree htop mailutils fortunes-fr vrms linuxlogo sysstat di discus pydf hardinfo lynx ack-grep pandoc most exuberant-ctags build-essential manpages-fr manpages-fr-dev manpages-fr-extra  git git-core git-email git-doc tig vim markdown xclip p7zip-full analog cloc tidy

Dev tools & servers

    sudo apt-get install php5 php5-dev php-apc php5-xdebug php5-sqlite php5-cli php5-curl php-pear php5-common php5-mcrypt php5-ps php5-pspell php5-tidy php5-intl apache2 apache2-mpm-prefork libapache2-mod-php5 apache2-utils mysql-server phpmyadmin

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

