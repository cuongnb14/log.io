# Author: Cuong Nguyen
#
# Build: docker build -t cuongnb14/logio:0.1.0 .
# Run: docker run -d -p 28778:28778 -p 28777:28777 --name logio cuongnb14/logio:0.1.0
#-----------------------------------------------------------------------------------------------------------------------

FROM node:6
MAINTAINER Cuong Nguyen cuongnb14@gmail.com

WORKDIR /usr/src/app
USER root

RUN apt-get update -qq
RUN apt-get install -y supervisor

RUN npm install -g log.io --user 'root'

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 28777
EXPOSE 28778

CMD ["/usr/bin/supervisord"]