

Removing ads
	
	sudo apt-get remove unity-lens-shopping

Install minimal swissknife tools

	sudo apt-get install vim google-chrome-stable

Usefull non-free-related stuff

	sudo apt-get install ubuntu-restricted-extras non-free-codecs libdvdcss2 faac faad ffmpeg ffmpeg2theora flac gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly icedax id3v2 lame libflac++6 libjpeg-progs libmpeg3-1 mencoder mjpegtools mp3gain mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 arj lha p7zip p7zip-full p7zip-rar rar unrar unace-nonfree
	
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


