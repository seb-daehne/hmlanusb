FROM alpine:3.14
MAINTAINER Sebastian Daehne <daehne@rshc.de>

RUN apk update && apk add make g++ gcc git libusb-dev

RUN mkdir /hmlanusb && \
    cd /hmlanusb && \
    git clone git://git.zerfleddert.de/hmcfgusb && \
    cd hmcfgusb && \
    make 

EXPOSE 1234
ENTRYPOINT ["/hmlanusb/hmcfgusb/hmland", "-p", "1234", "-v", "-I" ,"-D"]
