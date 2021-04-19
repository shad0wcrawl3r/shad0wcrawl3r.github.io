

divider(){
  echo "-----------------------------------------------------------------------"
}

#!/bin/bash
echo "This script is currently only meant to run after my personal ssh-key has been added to this system or a new key has been linked to the github account."
echo "If  the keys have not been added, this script will fail when cloning the repo from github"

curl ashwinbelbase.com.np/pages/automate.sh > /opt/automate.sh 	#for future updates

echo "@daily 15 cron.daily bash /etc/automate" >> /etc/anacrontab

divider
echo "Updating the apt repository."
divider
apt update

divider
echo "Installing  packages required for docker."
divider
apt install -y git apt-transport-https ca-certificates curl gnupg lsb-release
divider
echo "Adding the GPG key for docker."
divider
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
divider
echo "Adding the source file for docker"
divider
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
divider
echo "Update apt repository"
divider
apt update
divider
echo "Installing docker and python"
divider
apt install docker-ce docker-ce-cli containerd.io python3-pip python3-dev -y


divider
echo "Create a symbolic link for pip to pip3"
divider
ln -s $(whereis pip3 | awk '{print $2}' ) /usr/bin/pip

divider
echo "Upgrade Pip"
divider
python3 -m pip install pip --upgrade
divider
echo "Clone the github repository to /opt/"
divider
cd /opt/
git clone https://github.com/shad0wcrawl3r/Intuition.git
divider
echo "Change working directory to the repo source."
divider
cd /opt/Intuition	
echo "Install base requirements"
divider
pip install -r requirements.txt
#for some reason the code will not work with the default requirements.txt
divider
echo "for some reason the code will not entirely work with the default requirements.txt and needs these packages to be installed manually."
divider
pip install flask_sqlalchemy flask_bootstrap flask_wtf psutil pythonping ipcalc email-validator docker-compose psycopg2-binary
