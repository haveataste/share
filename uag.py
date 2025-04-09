import requests, re, os, sys

#url = 'https://upskirt-asian-girl.lol/'
url = sys.argv[1]
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36',
     'Content-Type': 'application/json'
    }
response = requests.get(url=url, headers=headers)
s = response.text
print(len(s))
# 匹配视频资源地址
pattern = r'https://video.twimg.com.+?mp4.+?(?=\\")'
a = re.findall(pattern, s)
print(len(a))

if len(a) != 0:
    # 读取已下载文件名
    with open('name.txt', 'r') as f:
        l = f.readline()
    na = l[:-1].split(',')

    for u in a:
        # 判断已下载文件名是否在视频资源地址中
        flag = True
        for f in na:
            if f in u:
                flag = False
        if flag:
            print(u)
            cmd = 'curl -O ' + u
            os.system(cmd)

    # 将当前目录下文件名和已下载文件名写入文本中
    s = l[:-1] + ','.join(os.listdir())
    with open('name.txt', 'w') as f:
        s = ','.join(list(set(s.split(','))))
        f.write(s)
