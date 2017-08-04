#Choose base image
FROM ubuntu:16.04

#Update base image
RUN apt-get update

#Install hhvm
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get update && apt-get -y install hhvm && apt-get -y install nano && apt-get -y install git

#pull ussd app
RUN git clone https://github.com/JaniKibichi/quickussd.git && \
    cd quickussd 

CMD ["/usr/bin/hhvm -m daemon -p 5500 ussd.php"]
