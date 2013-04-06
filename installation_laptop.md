
Set azerty keyboard

    sudo loadkeys fr
    sudo dpkg-reconfigure keyboard-configuration

Removing ads
	
	sudo apt-get remove unity-lens-shopping

Install minimal swissknife tools

	sudo apt-get install vim google-chrome-stable

Install minimal security tools

    sudo apt-get install fail2ban analog mailx rsync openssh-server 

Usefull non-free-related stuff

	sudo apt-get install ubuntu-restricted-extras non-free-codecs libdvdcss2 faac faad ffmpeg ffmpeg2theora flac gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly icedax id3v2 lame libflac++6 libjpeg-progs libmpeg3-1 mencoder mjpegtools mp3gain mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 arj lha rar unrar zip unzip p7zip p7zip-full p7zip-rar unace-nonfree

Date

    sudo dpkg-reconfigure tzdata
    sudo vim /etc/environment
        +1 ligne :
            TZ="Europe/Paris"


Shell enhancement

    sudo apt-get install curl tree htop fortunes-fr vrms linuxlogo sysstat di discus pydf hardinfo lynx ack-grep pandoc most exuberant-ctags linux-headers-generic build-essential manpages-fr manpages-fr-extra manpages-dev

Nautilus enhancement

    sudo apt-get install nautilus-actions nautilus-open-terminal nautilus-image-converter nautilus-open-terminal regexxer

Usefull basic softwares

    sudo apt-get install filezilla gimp vlc ffmpeg gmountiso bleachbit fslint sound-juicer lame wine msttcorefonts gtk-recordmydesktop powertop acpi pinta

Dev

    sudo apt-get install apache2 apache2-mpm-prefork libapache2-mod-php5 apache2-utils php5 php5-dev phpmyadmin mysql-server

    sudo apt-get install imagemagick php-apc php5-xdebug php5-mysql php5-sqlite php5-cli php5-curl php5-suhosin php-pear php5-gd php5-imagick php5-imap php5-xsl php5-common php5-mcrypt php5-memcache php5-ps php5-pspell php5-recode php5-snmp php5-tidy php5-intl php-geshi

    sudo apt-get install golang

Adding current user to www-data group

    sudo adduser $LOGNAME www-data

Set PHP Timezone

    sudo vim /etc/php5/apache2/php.ini /etc/php5/cli/php.ini -p
    => date.timezone = Europe/Paris

Set suhosin

    sudo vim /etc/php5/conf.d/suhosin.ini

        # add lines:

            # Source : //phpmyadmin/Documentation.html#faq1_38
            suhosin.request.max_vars = 2048
            suhosin.post.max_vars = 2048
            suhosin.request.max_array_index_length = 256
            suhosin.post.max_array_index_length = 256
            suhosin.request.max_totalname_length = 8192
            suhosin.post.max_totalname_length = 8192
            #suhosin.sql.bailout_on_error needs to be disabled (the default)
            #suhosin.log.* should not include SQL, otherwise you get big slowdown
            # see also SuhosinDisableWarning directive : //phpmyadmin/Documentation.html#cfg_SuhosinDisableWarning

Set PHP for phar archives & APC:

    sudo vim /etc/php5/apache2/php.ini /etc/php5/cli/php.ini -p

    # modify [Phar]:

        [Phar]
        ; http://php.net/phar.readonly
        phar.readonly = Off

        ; http://php.net/phar.require-hash
        phar.require_hash = Off

        detect_unicode = Off
        suhosin.executor.include.whitelist = phar

    # Add:

        apc.enabled = 1
        apc.enable_cli = 1

Mysql backup (in /home/toog/bin/mysqlbackup.sh)
 
    sudo mkdir /var/backups/mysql
    sudo chown toog:toog /var/backups/mysql
    sudo chmod 775 /var/backups/mysql
    # récupérer https://gist.github.com/1595563 dans /home/toog/bin/mysqlbackup.sh
    crontab -e (de toog)
    + 1 ligne:
        0 2 * * *	/home/toog/bin/mysqlbackup.sh >> /home/toog/bin/mysqlbackup.sh.log

Workaround for the php5-sqlite bug in Oneiric : (cf. http://goo.gl/Iaks4)

    sudo mv /etc/php5/conf.d/sqlite.ini /etc/php5/conf.d/sqlite.ini.bugged

Installing various PHP-related tools in /usr/local/bin

    sudo chown $LOGNAME:$LOGNAME /usr/local/bin -R
    cd /usr/local/bin
    curl -s http://getcomposer.org/installer | php
    mv composer.phar composer
    chmod +x composer

    curl http://pear2.php.net/pyrus.phar -O
    mv pyrus.phar pyrus
    chmod +x pyrus

    cd /usr/local/bin/
    curl http://cs.sensiolabs.org/get/php-cs-fixer.phar -O
    mv php-cs-fixer.phar php-cs-fixer
    chmod +x php-cs-fixer 
    php-cs-fixer self-update

PHP-quality related tools (see http://phpqatools.org/)
will install phpunit, phploc, phpcpd, phpcs, pdepend, phpmd, PHP_CodeBrowser, phpdcd

    sudo pear config-set auto_discover 1
    sudo pear install pear.phpqatools.org/phpqatools
    sudo pear install pear.phpunit.de/phpdcd-0.9.3

Find PEAR install dir & add Symfony2 Standards

    pear config-show | grep php_dir 
    cd /usr/share/php/PHP/CodeSniffer/Standards/
    sudo git clone git://github.com/opensky/Symfony2-coding-standard.git Symfony2 
    sudo phpcs --config-set default_standard Symfony2

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

    sudo apt-get install tidy markdown git git-core git-gui git-doc git-svn git-email gitk gitweb tig meld virtualbox-ose virtualbox-ose-guest-utils cloc umbrello dia gaphor

GIT configuration: http://progit.org/book/fr/ch4-4.html

Web dev tools

    sudo apt-get install gurlchecker linkchecker google-sitemapgen skipfish

MongoDB: cf. http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

Mongo backups

    sudo mkdir /var/backups/mongo
    sudo chown toog:toog /var/backups/mongo
    sudo chmod 775 /var/backups/mongo
    crontab -e (de toog)
    + 1 ligne:
        30 2 * * *	mongodump --directoryperdb -o /var/backups/mongo/`date +'%u'` > /home/toog/bin/mongobackup.cron.log



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

# Music

    sudo apt-get install solfege audacity alsa-oss banshee banshee-extension-ubuntuonemusicstore songbird

# Dell 1555 sound output
    
    sudo vim /etc/modprobe.d/alsa-base.conf
	=> Add :
		# Dell 1555 sound
		options snd-hda-intel model=dell-m6



