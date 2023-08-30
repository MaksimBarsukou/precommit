FROM alpine:3.10

RUN apk --update add bash git less openssh make && \
    apk add --upgrade grep && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN git clone https://github.com/awslabs/git-secrets.git && \
    cd git-secrets && \
    make install && \
    git secrets --register-aws --global && \
    git secrets --add 'AKIA[0-9A-Z]{16}' && \
    git secrets --add 'xox[baprs]-([0-9a-zA-Z]{10,48})?' 