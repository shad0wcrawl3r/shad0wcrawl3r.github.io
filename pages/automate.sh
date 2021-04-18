

divider(){
  echo "---------------------------------------"
}

#!/bin/bash
echo "This script is currently only meant to run after my personal ssh-key has been added to this system or a new key has been linked to the github account."
echo "If  the keys have not been added, this script will fail when cloning the repo from github"

divider()
echo "Updating the apt repository."
apt update

divider()
echo "Installing  packages required for docker."
apt install -y git apt-transport-https ca-certificates curl gnupg lsb-release
divider()
echo "Adding the GPG key for docker."
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
divider()
echo "Adding the source file for docker"
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
divider()
echo "Update apt repository"
apt update
divider()
echo "Installing docker and python"
apt install docker-ce docker-ce-cli containerd.io python3-pip python3-dev -y

divider()
divider()
echo "Create a symbolic link for pip to pip3"
ln -s $(whereis pip3 | awk '{print $2}' ) /usr/bin/pip

divider()
echo "Upgrade Pip"
python3 -m pip install pip --upgrade
divider()
echo "Clone the github repository"
git clone git@github.com:shad0wcrawl3r/OpenNMSFront.git
divider()
echo "Change working directory to the repo source."
cd OpenNMSFront
divider()
echo "Install base requirements"
pip install -r requirements.txt
#for some reason the code will not work with the default requirements.txt
divider()
echo "for some reason the code will not entirely work with the default requirements.txt and needs these packages to be installed manually."
pip install flask_sqlalchemy flask_bootstrap flask_wtf psutil pythonping ipcalc email-validator docker-compose psycopg2-binary
