#!/data/data/com.termux/files/usr/bin/bash

echo "Updating Termux packages..."
apt update
echo "Installing required packages..."
apt install wget proot -y
echo "Creating directory for Kali Linux installation..."
mkdir kali-fs
cd kali-fs
echo "Downloading Kali Linux rootfs..."
wget https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-full.tar.xz
echo "Extracting Kali Linux rootfs..."
tar xvf kalifs-armhf-full.tar.xz
echo "Creating script to start Kali Linux in Termux..."
cat > start-kali.sh <<- EOM
#!/data/data/com.termux/files/usr/bin/sh

proot --link2symlink tar -xf kalifs-armhf-full.tar.xz -C \$HOME

echo "nameserver 8.8.8.8" > \$HOME/kali-fs/etc/resolv.conf

cd \$HOME/kali-fs

bin/bash
EOM
chmod +x start-kali.sh
echo "Installation complete! Run ./start-kali.sh to start Kali Linux in Termux."
