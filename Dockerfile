FROM alpine:edge

RUN apk add --no-cache elixir ruby babashka python3

RUN mkdir -p /opt/website
WORKDIR /opt/website

COPY public/* .
COPY cgi-bin/ cgi-bin/

USER nobody:nobody
CMD "python3 -m http.server --cgi 101010"
