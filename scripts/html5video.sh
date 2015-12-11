#!/bin/bash
FILTERS="-filter:v crop=504:374:6:4,unsharp=5:5:1.0:5:5:0.0";
RESIZE="512x384";
VIDEO_BITRATE="1024k";
AUDIO_BITRATE="64k";
############################################################

### Videos

For HTML5 video transcoding:

mp4
```
ffmpeg -i Cancer_Breakthrough.ogv -c:v libx264 -pix_fmt yuv420p -profile:v
baseline -movflags faststart -preset slow -b:v 500k -maxrate 500k -bufsize
1000k -vf scale="854x480" -threads 0 -codec:a libfdk_aac -b:a 128k
Cancer_Breakthrough.mp4.480p.mp4
```

for f in "$@"
do

/usr/local/bin/ffmpeg -ss 00:00:02.01 -i "$f" -y -f image2 -vcodec mjpeg -vframes 1 $FILTERS -s $RESIZE "$f.jpg";

/usr/local/bin/ffmpeg -y -i "$f" -b:v $VIDEO_BITRATE -b:a $AUDIO_BITRATE -vcodec libx264 -g 30 $FILTERS -s $RESIZE "$f.mp4";

/usr/local/bin/ffmpeg -y -i "$f" -b:v $VIDEO_BITRATE -b:a $AUDIO_BITRATE -vcodec libvpx -acodec libvorbis -g 30 $FILTERS -s $RESIZE "$f.webm";

/usr/local/bin/ffmpeg -y -i "$f" -b:v $VIDEO_BITRATE -b:a $AUDIO_BITRATE -vcodec libtheora -acodec libvorbis -g 30 $FILTERS -s $RESIZE "$f.ogv";

/usr/local/bin/ffmpeg -y -i "$f" -b:v $VIDEO_BITRATE -b:a $AUDIO_BITRATE -f flv  -g 30 $FILTERS -s $RESIZE "$f.flv";

/usr/bin/flvtool2 -UP "$f.flv";

done
