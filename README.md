# Ambiente React native debian 9


* Venho aqui demonstrar a adaptação que uso para criar o ambiente de desenvolvimento em Debian GNU/Linux.<br>
Primeiro, perceba que deveremos modificar o arquivo /etc/apt/sources.list.

* Este é meu modelo:<br>

deb http://ftp.br.debian.org/debian/ stretch main <br>
deb-src http://ftp.br.debian.org/debian/ stretch main <br>

deb http://security.debian.org/debian-security stretch/updates main <br>
deb-src http://security.debian.org/debian-security stretch/updates main <br>

deb http://deb.debian.org/debian/ stretch-updates main contrib non-free <br>
deb-src http://deb.debian.org/debian/ stretch-updates main contrib non-free <br>

deb http://deb.debian.org/debian/ stretch-backports main contrib non-free <br>
deb-src http://deb.debian.org/debian/ stretch-backports main contrib non-free <br>

É necessario perceber que a minha distro codinome "stretch"; Este nome vai variar por lançamento de sua distro Debian:

 	  	
* 11.0  Bullseye
* 10.0  Buster  
* 9.0   Stretch  
* 8.0   Jessie  
* 7.0   Wheezy  
* 6.0   Squeeze  
* 5.0   Lenny   
* 4.0 	 Etch   
* 3.1 	 Sarge 	
* 3.0 	 Woody 	    
* 2.2 	 Potato 	
* 2.1 	 Slink 	
* 2.0 	 Hamm 	       
* 1.3 	 Bo 	      
* 1.2 	 Rex 	        
* 1.1 	 Buzz 	       

link para pesquisas posteriores: https://pt.wikipedia.org/wiki/Debian.<br>

# Agora supondo que você substituiu sua sources.list, vamos à mão na massa.<br>

* rode em um terminal o seguinte comando:<br>

sudo apt update && sudo apt upgrade -y

* Instalação android-tools-adb:

sudo apt install android-tools-adb

* Instalação do quemu-kvm.<br>

sudo apt install qemu-kvm -y <br>
sudo adduser $USER kvm<br>
id $USER<br>

* Instalação de pacotes essenciais a compilação e outros.<br>
sudo apt install -y build-essential libssl-dev libffi-dev apt-transport-https ca-certificates git-all wget curl software-properties-common<br>

* Instalação da url de download microsoft vscode IDE e ou editor.<br>
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

* Validação da chave para url.<br>
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

sudo rm -f packages.microsoft.gpg

* Instalação do nodejs e npm LTS versão.<br>
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&\
sudo apt install -y nodejs npm 

* Posteriormente instale o yarn com o comando npm i yarn.<br><br>

* Instalacão vscode.<br>
sudo apt install code -y

* Instalação do jdk e jre.<br>
sudo apt install default-jdk default-jre -y

* Instalação do gradle.<br>
sudo apt install zip unzip  -y

curl -O https://downloads.gradle-dn.com/distributions/gradle-7.3.2-bin.zip<br>
[link install guid](https://docs.gradle.org/7.3.2/userguide/installation.html)

* Agora é só baixar o android studio e fixar o seu $PATH.<br>
export ANDROID_HOME=$HOME/Android/Sdk<br>
export PATH=$PATH:$ANDROID_HOME/tools<br>
export PATH=$PATH:$ANDROID_HOME/platform-tools<br>
* Pronto se deu tudo certo você esta com um ambiente de desenvolvimento react/react native instalado na sua distro debian ou variante, obrigado e espero ter ajudado... \O.
