cd ~/MSM/tinkerboard/run
tar -xvzf wifi-connect-arm.tar.gz
chmod +x wifimonitor.sh
cd ..
sudo cp wifimonitor.service /etc/systemd/system/
sudo systemctl daemon-reload 
sudo systemctl enable wifimonitor.service 
sudo systemctl start wifimonitor.service
#install spotifyd and shairport-sync
sleep 60
sudo apt update
echo 'install sound recievers'
cd ~/MSM/
chmod +rwx spotifyd
sudo cp spotifyd /usr/bin/spotifyd
sudo apt install -y libasound2-dev libssl-dev pkg-config
sudo cp spotifyd.service /etc/systemd/user/
systemctl --user enable spotifyd.service --now
sudo apt install -y shairport-sync
echo '!tune of sync goes here manually!'
sudo systemctl restart shairport-sync.service
#install magicmirror
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -kfsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update 
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#maybe split this in separate file?
sudo groupadd docker
sudo usermod -aG docker linaro
newgrp docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
cd ~
git clone https://gitlab.com/khassel/magicmirror.git
cp ~/MSM/tinkerboard/docker-compose.yml ~/magicmirror/run/docker-compose.yml
cd ~/magicmirror/run
sudo docker compose up -d
sleep 20
cd ~/magicmirror/mounts/modules
git clone https://github.com/fewieden/MMM-ip.git
git clone https://github.com/Jopyth/MMM-Remote-Control.git
git clone https://github.com/kevinatown/MMM-Screencast.git
cp ~/MSM/MMM/config.js ~/magicmirror/mounts/config/config.js
echo ' thin ice goes here !!! do manually !'
docker exec -it mm /bin/bash
cd modules/MMM-Remote-Control/
npm install
cd ../MMM-Screencast/
npm install
exit
sudo docker restart mm
#install splash screen 
cd ~/MSM/splashscreen
sudo cp mixanich/ /usr/share/plymouth/themes/
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/mixanich/mixanich.plymouth 100
sudo update-initramfs -u
echo 'do not forget to tune sink in /etc/shairport-sync.conf to alsa set output_device = "plughw:0,2";'