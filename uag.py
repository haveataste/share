import requests, redis, re, os, sys

#url = 'https://upskirt-asian-girl.lol/'
url = sys.argv[1]
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36',
    'Content-Type': 'application/json'
}
response = requests.get(url=url, headers=headers)
s = response.text
print(len(s), end=' ')
# 匹配视频资源地址
pattern = r'https://video.twimg.com.+?mp4.+?(?=\\")'
vurls = re.findall(pattern, s)
print(len(vurls))

if len(vurls) != 0:
    r = redis.Redis(
        host='redis-16803.c331.us-west1-1.gce.redns.redis-cloud.com',
        port=16803,
        decode_responses=True,
        username="default",
        password="vGtH9u3kGN6vesr1Yl1Fthe2iwvCVdPj",
    )
    
    for vurl in vurls:
        pattern = r'([^/?#]+)(?:\?.*)?$'
        vn = re.search(pattern, vurl).group(1)
        if not r.sismember('upskirt', vn):
            cmd = 'curl -O ' + vurl
            os.system(cmd)
            r.sadd(vn)

    r.close()
