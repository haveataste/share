# generate test file
for i in `seq 1 100`
do touch file$i.ts
done

# sort
ls -l | awk '{print $9}' | sort -k1.5 -nr

# ffmpeg merge ts
ls | grep ts | sort -n -k1.5 | awk 'BEGIN{s="concat:";}{s=s$0"|";}END{cmd = "ffmpeg -i \""s"\" -c copy hls.mp4";sub(/\|\"/,"\"",cmd);print cmd;system(cmd);}'
