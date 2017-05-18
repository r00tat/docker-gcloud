FROM paulwoelfel/debian-docker:latest
MAINTAINER github@frig.at

ENV HOME /root
WORKDIR /root

RUN echo "deb https://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && \
	apt-get -y install \
	curl \
	google-cloud-sdk \
	google-cloud-sdk-app-engine-python \
	kubectl \
	python-crypto \
	vim \
	wget \
	&& \
	rm -rf /var/lib/apt/lists/*
COPY requirements.txt /root
RUN wget -q 'https://bootstrap.pypa.io/get-pip.py' -O get-pip.py && \
	python get-pip.py && \
	rm get-pip.py && \
	pip install -r /root/requirements.txt

VOLUME ["/root/.config"]
