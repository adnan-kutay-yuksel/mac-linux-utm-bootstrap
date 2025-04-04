# FIRST, AFTER THE ISO IS INSTALLED, WE'LL GO TO THE DEVICE'S NETWORK SETTINGS AND SELECT THE "BRIDGED (ADVANCED)" MODE.

# THEN WE CONNECT TO THIS FILE WITH THE COMMAND ftp ftp.xxxxxx.com (e.g. mybash.sh)
 
# MAKE THE SCRIPT EXECUTABLE WITH THE chmod +x mybash.sh COMMAND WHERE WE DOWNLOADED THE FILE

# Package Updates and Installations
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y locate

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Installation of SPICE Guest Tools for UTM
apt-get install -y spice-client-gtk spice-vdagent spice-webdavd spice-client-vdagent spice-client-webdavd qemu-guest-agent

# Cybersecurity Tools and Other Useful Programs
apt-get install -y enum4linux
apt-get install seclists
apt-get install -y xkill
apt-get install -y openvpn
apt-get install -y searchsploit
apt-get install -y remmina remmina-plugin-vnc remmina-plugin-spice remmina-plugin-rdp

# Optional
# Keyboard settings

sudo touch /etc/X11/xorg.conf.d/10-keyboard.conf
sudo echo "Section \"InputClass\"
        Identifier \"system-keyboard\"
        MatchIsKeyboard \"on\"
        Option \"XkbLayout\"  \"tr\"
        Option \"XkbModel\"   \"pc104\"
EndSection" >> /etc/X11/xorg.conf.d/10-keyboard.conf

sudo touch /etc/X11/xorg.conf.d/20-touchpad.conf
sudo echo "Section \"InputClass\"
    Identifier \"libinput touchpad catchall\"
        MatchIsTouchpad \"on\"
        MatchDevicePath \"/dev/input/event*\"
        Driver \"libinput\"
        Option \"NaturalScrolling\" \"on\"
EndSection" >> /etc/X11/xorg.conf.d/20-touchpad.conf

# Touchpad and Mouse Scroll Direction Correction
sudo touch /etc/X11/xorg.conf.d/30-pointer.conf
sudo echo "Section \"InputClass\"
        Identifier \"libinput pointer catchall\"
        MatchIsPointer \"on\"
        MatchDevicePath \"/dev/input/event*\"
        Driver \"libinput\"
        Option \"NaturalScrolling\" \"on\"
EndSection" >> /etc/X11/xorg.conf.d/30-pointer.conf

# Shared Folder Setup
$my_os = uname -a | head -c 7 | tail -c 1
if [ $my_os == "k" ]
then
    echo "kali linux detected!"
    sudo mkdir /home/kali/Desktop/myshared
    sudo mount -t 9p -o trans=virtio share /home/kali/Desktop/myshared -oversion=9p2000.L
    sudo echo "share    /home/kali/Desktop/myshared   9p  trans=virtio,version=9p2000.L,rw,_netdev,nofail 0   0" >> /etc/fstab
fi
if [ $my_os == "p" ]
then
    echo "parrot linux detected!"
    sudo mkdir /home/user/Desktop/myshared
    sudo mount -t 9p -o trans=virtio share /home/user/Desktop/myshared -oversion=9p2000.L
    sudo echo "share    /home/user/Desktop/myshared   9p  trans=virtio,version=9p2000.L,rw,_netdev,nofail 0   0" >> /etc/fstab
fi

# Process Completion and Restart
echo "PROCESS COMPLETED SUCCESSFULLY"
reboot now






