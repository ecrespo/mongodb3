# mongodb3
Archivo Dockerfile para crear un contenedor de mongodb3

El archivo Dockerfile contiene lo siguiente:
```
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
```

## Bajar la imagen

Para bajar la imagen se ejecuta: 
```
docker pull ecrespo/mongo3-custom
```

## Para ejecutar el contenedor

Se crea la persistencia de datos en /srv/data/db. 

```
docker run -p 27017:27017 -v /srv/data/db:/data/db:rw --name mongo_instance_001 -d mongo-custom3 --smallfiles
```


