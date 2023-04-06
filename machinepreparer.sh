#!/bin/bash

cat <<EOF

 __  __    _    ____ _   _ ____  ____  _____ ____  
|  \/  |  / \  / ___| | | |  _ \|  _ \| ____|  _ \ 
| |\/| | / _ \| |   | |_| | |_) | |_) |  _| | |_) |
| |  | |/ ___ \ |___|  _  |  __/|  _ <| |___|  __/ 
|_|  |_/_/   \_\____|_| |_|_|   |_| \_\_____|_|  

			Machine Preparer for hackers - @furk4n0zturk

EOF

# update & upgrade
apt update -y && apt upgrade -y

# tool install
apt install curl nmap dnsutils net-tools ssh ftp docker.io python3 python python3-pip python-pip unzip libpcap-dev wget gnupg2 git -y

# Acunetix install
## Username: admin@admin.com ##
## password: Admin123 ##

docker pull vouu/acu14
docker run -it -d --name awvs -p 3443:3443 --restart=always vouu/acu14:latest

# Go install

LATEST_GO_VERSION="$(curl --silent https://go.dev/VERSION?m=text)";

[ ! -d "/usr/local/go" ]
cd /tmp
wget https://go.dev/dl/${LATEST_GO_VERSION}.linux-amd64.tar.gz
tar -C /usr/local/ -xzf ${LATEST_GO_VERSION}.linux-amd64.tar.gz
rm -rf ${LATEST_GO_VERSION}.linux-amd64.tar.gz

cd /usr/local/
echo "export PATH=\$PATH:/usr/local/go/bin:\$HOME/go/bin" >> ~/.bashrc
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
source ~/.bashrc
go version

# nuclei install

cd /root
git clone https://github.com/projectdiscovery/nuclei.git; \
cd nuclei/v2/cmd/nuclei; \
go build; \
mv nuclei /usr/local/bin/; \
nuclei -version;

# httpx install

cd /root
git clone https://github.com/projectdiscovery/httpx.git; \
cd httpx/cmd/httpx; \
go build; \
mv httpx /usr/local/bin/; \
httpx -version;

# naabu install

cd /root
git clone https://github.com/projectdiscovery/naabu.git; \
cd naabu/v2/cmd/naabu; \
go build; \
mv naabu /usr/local/bin/; \
naabu -version;

# subfinder install

cd /root
git clone https://github.com/projectdiscovery/subfinder.git; \
cd subfinder/v2/cmd/subfinder; \
go build; \
mv subfinder /usr/local/bin/; \
subfinder -version;

# amass install

cd /root
git clone https://github.com/owasp-amass/amass.git; \
cd amass/cmd/amass; \
go build; \
mv amass /usr/local/bin/; \
amass -version;

# sublis3r install

cd /root
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip install -r requirements.txt

# metasploit install

cd /root
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod +x msfinstall
./msfinstall
msfdb init
msfconsole --version

# testssl install

cd /root
git clone --depth 1 https://github.com/drwetter/testssl.sh.git

# findomain install

cd /root
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
unzip findomain-linux.zip
chmod +x findomain
mv findomain /usr/bin/findomain
findomain --help

# osmedeus install

cd /root
bash <(curl -fsSL https://raw.githubusercontent.com/osmedeus/osmedeus-base/master/install.sh)

