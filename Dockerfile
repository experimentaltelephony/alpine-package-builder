FROM alpine:3.6
RUN apk --update upgrade
RUN apk add --no-cache g++ musl-dev alpine-sdk coreutils
RUN adduser -G abuild -g "Alpine package builder" -s /bin/sh -D builder
RUN echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir /home/builder/package
RUN chown builder:abuild /home/builder/package
WORKDIR /home/builder/package
USER builder
CMD "/bin/bash"
