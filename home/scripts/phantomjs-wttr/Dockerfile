#FROM - an alpine image or any image that you may use and are facing the issue
FROM node:6-alpine

# WORKDIR - any workdir that you may use
# RUN some other commands if needed

# If you also need fonts then add this - Select any fonts from here https://wiki.alpinelinux.org/wiki/Fonts#List_of_fonts_in_Alpine_Linux:~:text=ttf%2Dubuntu%2Dfont%2Dfamily
# Just replace ttf-ubuntu-font-family with fonts that you need
RUN apk --update add ttf-ubuntu-font-family fontconfig && rm -rf /var/cache/apk/*

RUN apk add imagemagick

# if ever you need to change phantom js version number in future ENV comes handy as it can be used as a dynamic variable
ENV PHANTOMJS_VERSION=2.1.1

RUN apk add --no-cache curl && \
    cd /tmp && curl -Ls https://github.com/topseom/phantomized/releases/download/2.1.1/dockerized-phantomjs.tar.gz | tar xz && \
    cp -R lib lib64 / && \
    cp -R usr/lib/x86_64-linux-gnu /usr/lib && \
    cp -R usr/share /usr/share && \
    cp -R etc/fonts /etc && \
    curl -k -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar -jxf - &&\
    cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
    rm -fR phantomjs-2.1.1-linux-x86_64 && \
    apk del curl

# RUN any other commands still pending
# ENTRYPOINT 
# CMD

RUN mkdir -p /raster-root \
        && mkdir -p /raster-output
COPY rasterize.js /raster-root/
WORKDIR /raster-root

COPY . .
# These line for /entrypoint.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
entrypoint "/entrypoint.sh"
