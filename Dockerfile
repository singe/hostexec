FROM alpine:edge
LABEL maintainer="@singe at SensePost <research@sensepost.com>"
COPY entrypoint.sh /usr/local/bin/
COPY host.sh /usr/local/bin/
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
