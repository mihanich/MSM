### Spotify connection and sharing
### Raspberry pi
sudo apt-get -y install curl && curl -ksL https://dtcooper.github.io/raspotify/install.sh | bash
# it may be required to change output device - Edit /etc/raspotify/conf --- 
# Audio device to use, use `librespot --device ?` to list options.
# Defaults to the system's default.
#LIBRESPOT_DEVICE="hw:CARD=Headphones,DEV=0" --- for raspberry pi

### asus tinker board


### AirPlay
###  https://github.com/mikebrady/shairport-sync/blob/master/BUILD.md
sudo apt update
sudo apt upgrade # this is optional but recommended
sudo apt-get install --no-install-recommends build-essential git autoconf automake libtool \
    libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev libsoxr-dev
git clone https://github.com/mikebrady/shairport-sync.git
cd shairport-sync
autoreconf -fi
./configure --sysconfdir=/etc --with-alsa \
    --with-soxr --with-avahi --with-ssl=openssl --with-systemd
make
sudo make install

sudo systemctl enable shairport-sync

#tune config in /etc/shairport-sync.conf
#alsa =
#{
#	output_device = "hw:Headphones";
#
sudo systemctl restart shairport-sync.service
iwconfig wlan0 power off