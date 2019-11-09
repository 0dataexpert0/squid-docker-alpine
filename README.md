# Squid with authorization in Docker Alpine container

Minimal docker Ubuntu image with [Squid] that only proxies authenticated requests.

### Usage
```
git clone https://github.com/0dataexpert0/squid-docker-alpine.git
cd squid-docker-alpine
docker-compose up -d
```
or with Docker build
```
git clone https://github.com/0dataexpert0/squid-docker-alpine.git
cd squid-docker-alpine
docker build .
docker images
docker run --name squid -d --restart=always   --publish 5129:5128   \
--volume /srv/docker/squid/squid.conf:/etc/squid3/squid.conf   \
--volume /srv/docker/squid/cache:/var/spool/squid3   \
--volume /srv/docker/squid/squid_passwd:/etc/squid/squid_passwd   \
paste_here_docker_image_id
```
When accessing the proxy, proxy user will be ```x```, and password will be ```x```
For change it use 
```
htpasswd -c squid_passwd your_username
```
after restart container.

License
----

BSD
### Docker and Docker-compose installation
   [squid]: <http://www.squid-cache.org/>
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
```
