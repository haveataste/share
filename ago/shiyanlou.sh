:<<!
# generate ssh.git
ssh-keygen
# tar -zcf - test.txt | openssl des3 -salt -k 123@123 | dd of=test.txt.des3
# dd if=test.txt.des3 | openssl des3 -d -k 123@123 | tar zxf -
tar -cvf ssh.tar .ssh/
mkdir ssh && cd ssh && mv ../ssh.tar .
git init
git add ssh.tar
git commit -a --allow-empty-message -m ''
git remote add origin git@github.com:kuugagoku/ssh.git
git push -u origin master
!
# ssh key
git clone http://github.com/kuugagoku/ssh.git && sh ssh/run.sh

# change python version
sudo rm /usr/bin/python && sudo ln -s /usr/bin/python3.5 /usr/bin/python

#https://gitlab.com/                52.167.219.168[美国 Microsoft公司]
#https://raw.githubusercontent.com  151.101.72.133
#https://codeload.github.com        192.30.253.120
# download github raw and zip
sudo sh -c "echo '151.101.72.133 raw.githubusercontent.com\n192.30.253.120 codeload.github.com' >> /etc/hosts"

# virtualenv: python3.5
sudo pip install virtualenv
virtualenv --python=/usr/bin/python3.5 she
source she/bin/activate
clear

# virtualenv: python3.5 django1.11
sudo pip install virtualenv
virtualenv --python=/usr/bin/python3.5 dj
source dj/bin/activate
pip install Django==1.11 && clear
