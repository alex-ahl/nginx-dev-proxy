# Nginx Dev Proxy

Creates a container which acts as a proxy between your local dev environment and the net. It's is useful for testing services which need to establish a connection to your local dev server; for example Webhooks, Open Graph Meta Tags sharing and SEO optimizations.

## Prerequisites

A server running the following

- Docker
- nginxproxy/nginx-proxy
  - Reverse proxy
- nginxproxy/acme-companion
  - Automatic cert generation
- A domain name pointing to your server
- If you're running a firewall (which you should be) - expose a chosen the port publicly.
