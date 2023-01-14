tk='tokyomotion'
if [[ $1 =~ $tk ]]
then
	curl -e 'https://www.tokyomotion.net/' -O $1
else
	curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36' -e 'https://avgle.com/' -O $1
fi
