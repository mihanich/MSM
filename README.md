In run directory choose correct architecture for device and unzip correct wifi-connect executive.
</br></br>
copy run directory in ~ before start config of service</br>
fix for wifimonitor inodes error - <i><b>echo fs.inotify.max_user_watches=65536 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p</b></i></br>

Shairport - https://docs.spotifyd.rs/installation/index.html </br>
Raspotify - https://dtcooper.github.io/raspotify/ </br>

MagicMirror all in one - https://github.com/sdetweil/MagicMirror_scripts </br>
</br></br>
for mirror better to use docker - https://khassel.gitlab.io/magicmirror/installation/
</br>
Add Docker's official GPG key:
</br>
sudo apt-get update
</br>
sudo apt-get install ca-certificates curl
</br>
sudo install -m 0755 -d /etc/apt/keyrings
</br>
sudo curl -kfsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
</br>
sudo chmod a+r /etc/apt/keyrings/docker.asc
</br>
</br></br>
Add the repository to Apt sources:
</br>
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
  </br>
sudo apt-get update 
</br>
</br>
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
</br>
</br>
sudo usermod -aG docker $USER
</br></br>
git clone https://gitlab.com/khassel/magicmirror.git
</br>
cd ./magicmirror/run
</br>
cp rpi_buster.yml docker-compose.yml
</br></br>
remove vchq device
</br>
</br></br>
cd ~magicmirror/mounts/modules/
</br>
git clone https://github.com/Jopyth/MMM-Remote-Control.git
</br>
git clone https://github.com/kevinatown/MMM-Screencast.git
</br>
git clone https://github.com/fewieden/MMM-ip.git
</br>

docker exec -it mm /bin/bash</br></br>
#and install both</br>

For asus tinkerboard set 
