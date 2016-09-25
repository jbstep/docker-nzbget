FROM alpine:3.4

RUN apk --update add openssl unrar && \
    wget -qO /tmp/nzbget.run \
        $(wget -qO- http://nzbget.net/info/nzbget-version-linux.json | \
        sed -n "s/^.*stable-download.*: \"\(.*\)\".*/\1/p") && \
    sh /tmp/nzbget.run && \
    rm /tmp/nzbget.run

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/downloads"]
EXPOSE 6789

CMD ["/start.sh"]
