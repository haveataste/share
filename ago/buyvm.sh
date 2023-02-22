apt-get update
apt-get install -y curl vim git tree net-tools unzip python3-pip screen docker.io zip language-pack-zh-hans nginx ffmpeg 


rm -rf /usr/bin/python && ln -s /usr/bin/python3.8 /usr/bin/python


#vim ~/.bashrc
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

alias ci='cd /var/www/html/mp'
alias dl='~/share/dl.sh'


#vim /etc/default/locale
