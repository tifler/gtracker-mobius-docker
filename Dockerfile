# This dockerfile is for Mobius
# It requires mysql-docker running alone
FROM ubuntu:18.04
MAINTAINER nungdo@gmail.com

ENV MOBIUS_BASE=/mobius
ENV REMOTE_GIT_ADDR=ssh://new-tako/home/mngr-repo/lap/IOT/gtracker-mobius.git

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl mosquitto mosquitto-clients \
        git apt-utils nodejs npm mysql-client iputils-ping
RUN curl -sL https://deb.nodesource.con/setup_8.x | bash -

COPY .gtracker-mobius ${MOBIUS_BASE}
COPY start-mobius.sh /bin/

RUN cd ${MOBIUS_BASE} && npm install

WORKDIR ${MOBIUS_BASE}

#ENTRYPOINT [ "node", "mobius.js" ]
