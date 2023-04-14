#!/bin/bash

cat <<EOF

 __  __    _    ____ _   _ ____  ____  _____ ____  
|  \/  |  / \  / ___| | | |  _ \|  _ \| ____|  _ \ 
| |\/| | / _ \| |   | |_| | |_) | |_) |  _| | |_) |
| |  | |/ ___ \ |___|  _  |  __/|  _ <| |___|  __/ 
|_|  |_/_/   \_\____|_| |_|_|   |_| \_\_____|_|  

			Machine Preparer for hackers - @furk4n0zturk

Machine Preparing...!

[+] Go
[+] Python
[+] Curl
[+] Git
[+] Nmap
[+] dnsutils
[+] net-tools
[+] Docker
[+] wget
[+] john the ripper
[+] hashcat
[+] nuclei
[+] httpx
[+] naabu
[+] subfinder
[+] amass
[+] Sublist3r
[+] Metasploit
[+] testssl
[+] findomain
[+] Osmedeus
[+] DalFox
[+] Gobuster
[+] dnsrecon
[+] subbrute

EOF
sleep 3

# update & upgrade
apt update -y && apt upgrade -y

# tool install
apt install curl nmap dnsutils net-tools ssh ftp docker.io python3 python python3-pip python-pip unzip libpcap-dev wget gnupg2 git screen john hashcat -y

# Go install

LATEST_GO_VERSION="$(curl --silent https://go.dev/VERSION?m=text)";

[ ! -d "/usr/local/go" ]
wget -P /tmp https://go.dev/dl/${LATEST_GO_VERSION}.linux-amd64.tar.gz
tar -C /usr/local/ -xzf /tmp/${LATEST_GO_VERSION}.linux-amd64.tar.gz
rm -rf /tmp/${LATEST_GO_VERSION}.linux-amd64.tar.gz

echo "export PATH=\$PATH:/usr/local/go/bin:\$HOME/go/bin" >> ~/.bashrc
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
source ~/.bashrc
go version

# nuclei install

git -C /root clone https://github.com/projectdiscovery/nuclei.git; \
go build -C /root/nuclei/v2/cmd/nuclei; \
mv /root/nuclei/v2/cmd/nuclei /usr/local/bin/; \
nuclei -version;

# httpx install

git -C /root clone https://github.com/projectdiscovery/httpx.git; \
go build -C /root/httpx/cmd/httpx; \
mv /root/httpx/cmd/httpx /usr/local/bin/; \
httpx -version;

# naabu install

git -C /root clone https://github.com/projectdiscovery/naabu.git; \
go build -C /root/naabu/v2/cmd/naabu; \
mv /root/naabu/v2/cmd/naabu /usr/local/bin/; \
naabu -version;

# subfinder install

git -C /root clone https://github.com/projectdiscovery/subfinder.git; \
go build -C /root/subfinder/v2/cmd/subfinder; \
mv /root/subfinder/v2/cmd/subfinder /usr/local/bin/; \
subfinder -version;

# amass install

git -C /root clone https://github.com/owasp-amass/amass.git; \
go build -C /root/amass/cmd/amass; \
mv /root/amass/cmd/amass /usr/local/bin/; \
amass -version;

# sublis3r install

git -C /root clone https://github.com/aboul3la/Sublist3r.git
pip install -r /root/Sublist3r/requirements.txt

# metasploit install

curl -s https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /root/msfinstall
chmod +x /root/msfinstall
sh /root/msfinstall
msfdb init
msfconsole --version

# testssl install

git -C /root clone --depth 1 https://github.com/drwetter/testssl.sh.git

# findomain install

curl -sLO -o /root https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
unzip /root/findomain-linux.zip
chmod +x /root/findomain
mv /root/findomain /usr/bin/findomain
findomain --help

# osmedeus install

wget -P /root https://raw.githubusercontent.com/osmedeus/osmedeus-base/master/install.sh
bash /root/install.sh

# dalfox install

go install -C /root github.com/hahwul/dalfox/v2@latest

# gobuster install

go install -C /root github.com/OJ/gobuster/v3@latest

# dnsrecon install

git -C /root clone https://github.com/darkoperator/dnsrecon.git
pip3 install -r /root/dnsrecon/requirements.txt

# subbrute install

git -C /root clone https://github.com/TheRook/subbrute.git

