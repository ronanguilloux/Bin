

Removing ads
	
	sudo apt-get remove unity-lens-shopping

Install minimal swissknife tools

	sudo apt-get install vim google-chrome-stable

Usefull non-free-related stuff

	sudo apt-get install ubuntu-restricted-extras non-free-codecs libdvdcss2 faac faad ffmpeg ffmpeg2theora flac gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly icedax id3v2 lame libflac++6 libjpeg-progs libmpeg3-1 mencoder mjpegtools mp3gain mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 arj lha p7zip p7zip-full rar unrar zip unzip p7zip p7zip-full p7zip-rar unace-nonfree

Shell enhancement

    sudo apt-get install curl tree htop fortunes-fr vrms linuxlogo sysstat di discus pydf hardinfo lynx ack-grep pandoc most exuberant-ctags linux-headers-generic build-essential manpages-fr manpages-fr-extra

Nautilus enhancement

    sudo apt-get install nautilus-actions nautilus-open-terminal nautilus-image-converter nautilus-open-terminal regexxer

Usefull basic softwares

    sudo apt-get install filezilla gimp vlc ffmpeg gmountiso bleachbit fslint sound-juicer lame wine msttcorefonts gtk-recordmydesktop powertop acpi pinta

Dev

    sudo apt-get install apache2 apache2-mpm-prefork libapache2-mod-php5 apache2-utils php5 php5-dev phpmyadmin mysql-server

    sudo apt-get install imagemagick php-apc php5-xdebug php5-mysql php5-sqlite php5-cli php5-curl php5-suhosin php-pear php5-gd php5-imagick php5-imap php5-xsl php5-common php5-mcrypt php5-memcache php5-ps php5-pspell php5-recode php5-snmp php5-tidy php5-intl php-geshi

Adding current user to www-data group

    sudo adduser $LOGNAME www-data

Installing various PHP-related tools in /usr/local/bin

    sudo chown $LOGNAME:$LOGNAME /usr/local/bin -R
    cd /usr/local/bin
    curl -s http://getcomposer.org/installer | php
    mv composer.phar composer
    chmod +x composer
    composer self-update

    curl http://pear2.php.net/pyrus.phar -O
    mv pyrus.phar pyrus
    chmod +x pyrus
    pyrus install pear/PHP_CodeSniffer

PHP-quality related tools (see http://phpqatools.org/)
will install phpunit, phploc, phpcpd, phpcs, pdepend, phpmd, PHP_CodeBrowser, phpdcd

    sudo pear config-set auto_discover 1
    sudo pear install pear.phpqatools.org/phpqatools
    sudo pear install pear.phpunit.de/phpdcd-0.9.3

Apache2 mods

    sudo a2enmod rewrite
    sudo a2enmod headers
    sudo a2enmod deflate
    sudo a2enmod expires
    sudo a2enmod setenvif
    sudo service apache2 restart

Vhost GIT related mods

    sudo a2enmod dav
    sudo a2enmod dav_fs

Dev GUI & tools

    sudo apt-get install tidy markdown git git-core git-gui git-doc git-svn git-email gitk tig meld virtualbox-ose virtualbox-ose-guest-utils cloc umbrello dia gaphor

Web dev tools

    sudo apt-get install gurlchecker linkchecker google-sitemapgen skipfish

Office stuff

    sudo apt-get install freemind planner collatinus conduit grsync hamster

Education

    sudo apt-get install tuxtype gtypist celestia planets stellarium gbrainy

Tweakers : Ubuntu Tweak (official maintained PPA) Compiz Settings Manager & gconf-editor

	sudo add-apt-repository ppa:tualatrix/ppa && sudo apt-get update && sudo apt-get install ubuntu-tweak
	sudo apt-get install gconf-editor

Auto-mounting NTFS Windows partition

* In the Terminal, enter sudo blkid to get the UUID (Universally Unique Identifier) of the partition you want to mount.
* Enter sudo mkdir /media/ntfs to create a mount point
* Enter gksu gedit /etc/fstab and add the following line in the fstab file:
* UUID=1234567890123456 /media/ntfs ntfs rw,nosuid,nodev,noatime,allow_other 0 0
* Replace the above 16-digit number with the UUID got from step 1, then click 'Save'.

Install "CompizConfig Settings Manager" from the Ubuntu Apps Directory
* https://apps.ubuntu.com/cat/applications/pysdm/


Adding current user to www-data group

    sudo adduser $LOGNAME www-data

