#/bin/bash
#
echo "    .:.:.    Speed code for DEBIAN"
echo "  .:.: :.:.  By Shadowruge"
echo " :.:       . 17/11/22"
echo " .:.:      . 19:36"
echo "  .:.:.:.:.  Anbient React-native"
echo "    ::::::   Version beta:001_01.22"
#
echo "Instalação de ambiente de desenvolvimento reactnative" 
#
echo "Primeira verificação"
#
sudo apt update && sudo apt upgrade -y
#
echo "Instalação android-tools-adb"
#
sudo apt install android-tools-adb
#
#
echo "Instalação do quemu-kvm"
#
sudo apt install qemu-kvm -y
sudo adduser $USER kvm
id $USER
#
#Update the system
echo "Updating the system"
sudo apt update
#
#Install the necessary packages
echo "Installing the necessary packages"
sudo apt install -y build-essential libssl-dev libffi-dev apt-transport-https ca-certificates git-all wget gpg curl software-properties-common
#
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo rm -f packages.microsoft.gpg
#
echo "Clean cache"
sudo apt clean
#
#install nodejs and npm LTS version
echo "Installing nodejs and npm LTS version"
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&\
echo "Using Debian, as root"
sudo apt install -y nodejs
#
echo "Install vscode"
sudo apt install code -y
#
echo "Instalação do jdk e jre"
#
sudo apt install default-jdk default-jre -y
java -v
#
echo "Instalação do gradle"
#
sudo apt install zip unzip  -y
#
curl -O https://downloads.gradle-dn.com/distributions/gradle-7.3.2-bin.zip
#
unzip gradle-7.3.2-bin.zip
sudo mv gradle-7.3.2 /opt/gradle
ls /opt/gradle/
#
echo "variaveis de ambiente $PATH"
#
echo "export PATH=/opt/gradle/bin:${PATH}" | sudo tee /etc/profile.d/gradle.sh
#
sudo chmod +x /etc/profile.d/gradle.sh
source /etc/profile.d/gradle.sh
gradle -v
#
#
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

