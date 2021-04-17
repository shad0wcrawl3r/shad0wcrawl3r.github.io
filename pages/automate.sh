

#!/bin/bash
echo "This script is currently only meant to run after my ssh-key has been added to github account or linked"
apt update
apt install -y git apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io python3-pip python3-dev -y
ln -s $(whereis pip3 | awk '{print $2}' ) /usr/bin/pip
python3 -m pip install pip --upgrade
git clone git@github.com:shad0wcrawl3r/OpenNMSFront.git
cd OpenNMSFront
pip install -r requirements.txt
#for some reason the code will not work with the default requirements.txt
pip install flask_sqlalchemy flask_bootstrap flask_wtf psutil pythonping ipcalc email-validator docker-compose psycopg2-binary
