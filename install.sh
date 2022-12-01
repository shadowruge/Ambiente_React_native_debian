
* Venho aqui demonstrar a adaptação que uso para criar o ambiente de desenvolvimento em Debian GNU/Linux.
Primeiro, perceba que deveremos modificar o arquivo /etc/apt/sources.list.

* Este é meu modelo:

deb http://ftp.br.debian.org/debian/ stretch main
deb-src http://ftp.br.debian.org/debian/ stretch main

deb http://security.debian.org/debian-security stretch/updates main
deb-src http://security.debian.org/debian-security stretch/updates main

deb http://deb.debian.org/debian/ stretch-updates main contrib non-free
deb-src http://deb.debian.org/debian/ stretch-updates main contrib non-free

deb http://deb.debian.org/debian/ stretch-backports main contrib non-free
deb-src http://deb.debian.org/debian/ stretch-backports main contrib non-free

É necessario perceber que a minha distro codinome "stretch"; Este nome vai variar por lançamento de sua distro Debian:

 	  	
* 11.0  Bullseye
* 10.0  Buster  
* 9.0   Stretch  
* 8.0   Jessie  
* 7.0   Wheezy  
* 6.0   Squeeze  
* 5.0   Lenny   
* 4.0 	  Etch   
* 3.1 	  Sarge 	
* 3.0 	  Woody 	    
* 2.2 	  Potato 	
* 2.1 	  Slink 	
* 2.0 	  Hamm 	       
* 1.3 	  Bo 	      
* 1.2 	  Rex 	        
* 1.1 	  Buzz 	       

link para pesquisas posteriores: https://pt.wikipedia.org/wiki/Debian.

Agora supondo que você substituiu sua sources.list, vamos à mão na massa.

* rode em um terminal o seguinte comando:

sudo apt update && sudo apt upgrade -y

* Instalação android-tools-adb:

sudo apt install android-tools-adb

* Instalação do quemu-kvm
sudo apt install qemu-kvm -y
sudo adduser $USER kvm
id $USER

* Instalação de pacotes essenciais a compilação e outros.
sudo apt install -y build-essential libssl-dev libffi-dev apt-transport-https ca-certificates git-all wget curl software-properties-common

* Instalação da url de download microsoft vscode IDE e ou editor.
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

* Validação da chave para url.
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

sudo rm -f packages.microsoft.gpg

* Instalação do nodejs e npm LTS versão.
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&\
sudo apt install -y nodejs npm 

* Posteriormente instale o yarn com o comando npm i yarn

* Instalacão vscode.
sudo apt install code -y

* Instalação do jdk e jre.
sudo apt install default-jdk default-jre -y

* Instalação do gradle
sudo apt install zip unzip  -y

curl -O https://downloads.gradle-dn.com/distributions/gradle-7.3.2-bin.zip

* Descompacte-o dentro de sua pasta de download e depois mova -o para o diretório /opt.
sudo mv gradle-7.3.2 /opt/gradle
* Use o comando ls para visualizar o conteúdo da pasta.
ls /opt/gradle/

* Variáveis de ambiente $PATH.
export PATH=/opt/gradle/bin:${PATH}" | sudo tee /etc/profile.d/gradle.sh

* De permissão para execução.
sudo chmod +x /etc/profile.d/gradle.sh
source /etc/profile.d/gradle.sh
* Verifique se a instalação
gradle -v

* Agora é só baixar o android studio e fixar o seu $PATH.
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

* Pronto se deu tudo certo você esta com um ambiente de desenvolvimento react/react native instalado na sua distro debian ou variante, obrigado e espero ter ajudado... \O.
