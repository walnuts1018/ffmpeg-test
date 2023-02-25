FROM ubuntu:22.04

RUN apt update && apt install wget xz-utils -y

#ffmpeg
WORKDIR /ffmpeg
RUN wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-arm64-static.tar.xz
RUN tar Jxfv ffmpeg-git-arm64-static.tar.xz
RUN ls
RUN cp ./ffmpeg-git-*-arm64-static/ffmpeg /usr/local/bin/

#fswebcam
WORKDIR /fswebcam
RUN apt install fswebcam -y
CMD while : ; do DATE=$(date +"%Y-%m-%d_%H%M"); fswebcam -r 1920x1080 -d /dev/video0 --no-banner /webcam/$DATE.jpg; sleep 1m; done
LABEL org.opencontainers.image.source=https://github.com/walnuts1018/webcam-docker-test