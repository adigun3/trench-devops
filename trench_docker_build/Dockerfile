# Use the official image as a perent image
FROM ubuntu:20.04

# Set the  Working diretory
WORKDIR /app

ADD . /app
EXPOSE 3000



#	Install Joy dependencies:
	RUN apt-get update
	RUN apt-get -y install gcc git libcurl3 figlet libcurl4-openssl-dev libpcap0.8 libpcap-dev libssl-dev make python3 python3-pip ruby ruby-ffi zlib1g-dev
        RUN pip3 install wheel pandas sklearn







