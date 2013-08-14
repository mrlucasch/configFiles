#! /bin/bash


##Need to add the /etc/clusters file
##Need to add changes to sudoers
##Need to add java zenmap eclipse and other software
##Need to add part that copies down the config files needed.



cd
mkdir setup
cd setup
echo "###################Installing software####################";
sudo apt-get install -y  git terminator clusterssh htop atop iftop vim 
3
echo "###################Installing chrome#####################";
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ./google-chrome*.deb
sudo apt-get install -f

echo "#################Installing Dropbox#######################";
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf .

~/.dropbox-dist/dropboxd

echo "################Updating System##########################";
sudo apt-get update
sudo apt-get upgrade

echo "#################Removing setup file";
cd
sudo rm -r setup
echo "##############Machine setup complete#####################";

