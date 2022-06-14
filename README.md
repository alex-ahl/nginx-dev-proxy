# nginx-dev-proxy

Creates a container which acts as a proxy between your local dev environment and the public web.

It's is useful for testing services which need to establish a connection to your local dev server; for example Webhooks, Open Graph Meta Tags sharing and SEO optimizations.

## Prerequisites

A server running the following

- `Docker`
- `jwilder/nginx-proxy` as a reverse proxy
- `nginxproxy/acme-companion` for automatic cert generation
- A `domain name` pointing to your server
- An `exposed port` in your firewall

## Instructions

Clone the repo to your server and replace the placeholder variables in docker-compose.yml.

```
REMOTE_PORT: The port exposed to the public web
SSH_PUB_KEY: Your dev machines pub key (usually in ~/.ssh/id_rsa.pub)
DOMAIN: The domain pointing to the server, for example dev.domain.xyz
```

Replace the docker network in docker-compose with the external network nginxproxy/nginx-proxy is using.

Copy `tunup.sh` to your local dev machine and run it.

## Other

For more information on setting up a reverse proxy see https://hub.docker.com/r/jwilder/nginx-proxy
