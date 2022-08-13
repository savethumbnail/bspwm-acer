

ip a

#sudo echo 'fastestmirror=true' >> /etc/dnf/dnf.conf
#sudo echo 'deltarpm=true' >> /etc/dnf/dnf.conf 

sudo dnf update -y && sudo dnf upgrade -y

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf install nitrogen iwlax2xx-firmware fish git nitrogen alacritty mesa-dri-drivers gwe wget firefox mozilla-fira-mono-fonts materia-gtk-theme papirus-icon-theme lxappearance dmenu bspwm sxhkd polybar unar unzip tar pcmanfm Xorg xorg-x11-xinit neovim akmod-nvidia xorg-x11-drv-nvidia-cuda libappindicator-gtk3 NetworkManager-openvpn-gnome network-manager-applet -y 


#Brave-Beta
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-beta.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc
sudo dnf install brave-browser-beta -y


#VS-Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf update -y
sudo dnf install code -y

#ProtonVpn
wget https://protonvpn.com/download/protonvpn-stable-release-1.0.1-1.noarch.rpm
sudo dnf install protonvpn-stable-release-1.0.1-1.noarch -y

sudo dnf update -y && sudo dnf upgrade -y

sudo dnf install protonvpn -y
sudo dnf install python3-pip -y
pip3 install --user dnspython>=1.16.0




#Font-Awesome
wget https://use.fontawesome.com/releases/v6.1.2/fontawesome-free-6.1.2-desktop.zip
cd /usr/share/fonts
sudo unzip ~/fontawesome-free-6.1.2-desktop

cd

#Setting up Bswpm
git clone https://github.com/savethumbnail/bspwm-acer.git
mkdir ~/.config && mkdir ~/.start
cd bspwm-acer
cp alacritty bspwm  sxhkd ~/.config -r && cp start.sh ~/.start -r
cd 
cd ~/.config

cd bspwm
chmod +x bspwmrc

cd ..

# cd polybar
# chmod +x launch.sh config

# cd ..

cd sxhkd
chmod +x sxhkdrc

cd ~/bspwm-acer
chmod +x disable-nouveau-driver.sh

cd

#Disabling Nouveau Driver
#sudo touch blacklist-nouveau.conf
#echo 'blacklist nouveau' >> blacklist-nouveau.conf
#echo 'options nouveau modeset=0' >> blacklist-nouveau.conf
#sudo mv blacklist-nouveau.conf /etc/modprobe.d/
#sudo dracut --force

sudo bash ~/bspwm-acer/disable-nouveau-driver.sh

#Nvidia --rechecking
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y


sudo dnf remove pipewire -y

printf "\e[1;32mDone! Now if you didn't encountered any error you can reboot.\e[0m"





















