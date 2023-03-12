FROM ghcr.io/rushsteve1/cgify:main

RUN apk add --no-cache elixir ruby zola

RUN mkdir -p /opt/website
WORKDIR /opt/website

COPY config.toml .
COPY templates templates
COPY static static
COPY content content
RUN zola build
COPY cgi-bin public/cgi-bin

USER nobody:nobody
ENV HOME=/tmp
RUN mix local.hex --force && mix local.rebar --force

EXPOSE 10101
CMD ["cgify", "-http", "-v", "public/"]
