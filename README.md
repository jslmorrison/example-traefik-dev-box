# Intro

A local web development environment using Traefik as the proxy and Portainer as UI into the running containers.

# Setup

Copy the .env.dist file to .env and change the values for:
- the ```TRAEFIK_HOST_RULE``` and the ```PORTAINER_HOST_RULE``` to the desired FQDNs. Also, ensure you have corresponding entries in your ```/etc/hosts``` file. 

For each new project or dev domain that you want to incorporate add the following labels to its ```docker-compose.yaml``` file.

**for example:**
``` docker-compose
labels:
      - "traefik.docker.network=traefik-web"
      - "traefik.enable=true"
      - "traefik.http.routers.project1.rule=Host(`project1.example.com`)"
      - "traefik.http.routers.project1.tls=true"
```

and put them on the same network as defined here.


# Usage

Create the network and start the containers:

- ```docker network create traefik-web```
- ```docker-compose up [-d]```

or use the Makefile.

**N.B Change these urls to match the .env values.**

- https://traefik.example.com   The Traefik dashboard 
- https://portainer.example.com The Portainer dashboard
