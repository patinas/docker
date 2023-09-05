#!/bin/sh


#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo apt install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker

docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=Europe/Copenhagen \
  -v ./:/config \
  -p 8123:8123 \
  ghcr.io/home-assistant/home-assistant:stable



  ## If using cloudflare tunnel (configuration.yaml) - Add the below lines

  # http:
  # use_x_forwarded_for: true
  # trusted_proxies:
  #  - XXX.XXX.XXX.XXX # Add the IP address of the proxy server