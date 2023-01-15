if [[ $1 =~ 'tokyomotion' ]];then
curl -e 'https://www.tokyomotion.net/' -O $1
elif [[ $1 =~ 'seg' ]];then
curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36' -e 'https://avgle.com/' -O $1
ls | grep .ts | sort -n -k1.5 | awk 'BEGIN{s="concat:";}{s=s$0"|";}END{cmd = "ffmpeg -i \""s"\" -c copy hls.mp4";sub(/\|\"/,"\"",cmd);print cmd;system(cmd);}'
rm -rf *.ts
elif [[ $1 =~ 'voyeurhit' ]];then
curl -sSL -e 'https://member.voyeurhit.com/' -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36' -O $1
fi
