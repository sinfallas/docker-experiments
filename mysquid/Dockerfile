FROM ubuntu/squid
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends --no-install-suggests nano
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
COPY ./squid.conf /etc/squid/squid.conf
