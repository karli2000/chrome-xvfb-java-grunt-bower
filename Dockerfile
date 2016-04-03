FROM node:5.9.1
MAINTAINER Max Kossatz <max@kossatz.com>

RUN \
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
apt-get update -y && \
apt-get install -y xvfb unzip zip google-chrome-stable openjdk-7-jdk && \
Xvfb :1 -screen 0 1600x1200x16 & && \
export DISPLAY=:1.0  && \
npm install -g grunt-cli && \
npm install -g bower && \
npm install -g gulp-cli && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*