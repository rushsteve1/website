FROM alpine:edge

RUN apk add --no-cache elixir ruby python3

RUN mkdir -p /opt/website
WORKDIR /opt/website

COPY public/* .
COPY cgi-bin/ cgi-bin/

USER nobody:nobody
EXPOSE 10101
CMD ["python", "-m", "http.server", "--cgi", "10101"]
