FROM ghcr.io/rushsteve1/cgify:main

RUN apk add --no-cache elixir ruby

RUN mkdir -p /opt/website
WORKDIR /opt/website

COPY public/* .
COPY cgi-bin/ cgi-bin/

USER nobody:nobody

EXPOSE 10101
CMD ["cgify", "-http", "-v", "."]
