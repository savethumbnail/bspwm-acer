#Disabling Nouveau Driver

sudo touch blacklist-nouveau.conf
echo 'blacklist nouveau' >> blacklist-nouveau.conf
echo 'options nouveau modeset=0' >> blacklist-nouveau.conf
sudo mv blacklist-nouveau.conf /etc/modprobe.d/
sudo dracut --force