FROM alpine

RUN apk add --update \
    bash \
    inkscape

ENV src=/svg \
    dist=/png

RUN mkdir -p $dist
COPY devicon/icons $src
COPY svg2png.sh .

CMD ./svg2png.sh
