In run directory choose correct architecture for device and unzip correct wifi-connect executive.

copy run directory in ~ before start config of service
fix for wifimonitor inodes error - 
<i><b>echo fs.inotify.max_user_watches=65536 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p</b></i>

Shairport - https://docs.spotifyd.rs/installation/index.html 
Raspotify - https://dtcooper.github.io/raspotify/ 

MagicMirror all in one - https://github.com/sdetweil/MagicMirror_scripts 

for mirror better to use docker - https://khassel.gitlab.io/magicmirror/installation/

Add Docker's official GPG key:

sudo apt-get update

sudo apt-get install ca-certificates curl

sudo install -m 0755 -d /etc/apt/keyrings

sudo curl -kfsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc


Add the repository to Apt sources:

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
  
sudo apt-get update 


sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 


sudo usermod -aG docker $USER

git clone [https://gitlab.com/khassel/magicmirror.git](https://gitlab.com/mixanich/magicmirror)

cd ./magicmirror/run

cp rpi_buster.yml docker-compose.yml

remove vchq device


cd ~magicmirror/mounts/modules/

git clone https://github.com/mihanich/MMM-Remote-Control.git

git clone https://github.com/mihanich/MMM-Screencast.git

git clone https://github.com/mihanich/MMM-ip.git


docker exec -it mm /bin/bash
#and install both
