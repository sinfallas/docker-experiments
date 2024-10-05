FROM postgres:15.2-bullseye
LABEL maintainer="sinfallas@gmail.com"

WORKDIR /app
COPY ./script .
RUN chmod 777 /app/script
RUN apt update && apt -y install --no-install-recommends --no-install-suggests nano swaks libnet-ssleay-perl libcrypt-ssleay-perl diffutils && rm -rf /var/lib/{apt,dpkg,cache,log} && apt-get clean
