cd ~/MSM/tinkerboard/run
tar -xvzf wifi-connect-v4.4.6-linux-armv7hf.tar.gz
chmod +x wifimonitor.sh
cd ..
sudo cp wifimonitor.service /etc/systemd/system/
sudo systemctl daemon-reload 
sudo systemctl enable wifimonitor.service 
sudo systemctl start wifimonitor.service
#install spotifyd and shairport-sync
sudo apt remove aiccagent
echo 'install sound recievers'
cd ..
chmod +x spotifyd
sudo cp spotifyd /usr/bin/
sudo apt install -y libasound2-dev libssl-dev pkg-config
sudo cp spotifyd.service /etc/systemd/user/
systemctl --user enable spotifyd.service --now
sudo apt install shairport-sync
sudo systemctl restart shairport-sync.service
#install magicmirror
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -kfsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update 
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
sudo usermod -aG docker $USER
newgrp docker
cd ~
git clone https://gitlab.com/khassel/magicmirror.git
cp MSM/tinkerboard/docker-compose.yml magicmirror/run/docker-compose.yml
cd magicmirror/run
docker compose up -d
cd magicmirror/mounts/modules
git clone https://github.com/fewieden/MMM-ip.git
git clone https://github.com/Jopyth/MMM-Remote-Control.git
git clone https://github.com/kevinatown/MMM-Screencast.git
docker exec -it mm /bin/bash
cd modules/MMM-Remote-Control/
npm install
cd ../MMM-Screencast/
npm install
exit
cp MSM/MMM/config.js magicmirror/mounts/config/config.js
docker restart mm
#install splash screen 
cd ~/MSM/splashscreen
sudo cp mixanich /usr/share/plymouth/themes/
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/mixanich/mixanich.plymouth 100
sudo update-initramfs -u
echo 'do not forget to tune sink in /etc/shairport-sync.conf to alsa set output_device = "plughw:0,2";'