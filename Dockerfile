
FROM debian
MAINTAINER Ernesto Crespo <ecrespo@gmail.com> 
USER root
WORKDIR /code
RUN echo "deb http://ftp.debian.org/debian jessie main contrib non-free" > /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" |  tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update && apt-get install -y mongodb-org
RUN apt-get install -y sudo vim less mc locate
RUN apt-get clean
RUN mkdir -p /data/db
RUN echo "mongodb ALL=NOPASSWD: ALL" >> /etc/sudoers

EXPOSE 27017
ENTRYPOINT ["/usr/bin/mongod"]

