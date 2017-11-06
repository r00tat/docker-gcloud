FROM paulwoelfel/debian-docker:latest
MAINTAINER github@frig.at

ENV HOME /root
WORKDIR /root

# RUN (echo "deb https://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list) && \
# 	(curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -) && \
RUN	apt-get update && \
	apt-get -y upgrade && \
	apt-get -y install \
		curl \
		# google-cloud-sdk \
		# google-cloud-sdk-app-engine-python \
		# kubectl \
		python-crypto \
		vim \
		wget \
	&& \
	rm -rf /var/lib/apt/lists/* && \
	cd /usr/local/ && \
	# wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-170.0.1-linux-x86_64.tar.gz -O google-cloud-sdk.tgz && \
	# tar xzf google-cloud-sdk.tgz && \
	# rm google-cloud-sdk.tgz && \
	# bash google-cloud-sdk/install.sh && \
	wget 'https://sdk.cloud.google.com' -O install-gcloud.sh && \
	chmod +x install-gcloud.sh && \
	./install-gcloud.sh --disable-prompts --install-dir=/usr/local/ && \
	rm install-gcloud.sh && \
	export PATH="/usr/local/google-cloud-sdk/bin:${PATH}" && \
	ln -s /usr/local/google-cloud-sdk/bin/gcloud /usr/bin/gcloud && \
	ln -s /usr/local/google-cloud-sdk/bin/gsutil /usr/bin/gsutil && \
	ln -s /usr/local/google-cloud-sdk/bin/bq /usr/bin/bq && \
	ln -s /usr/local/google-cloud-sdk/bin/kubectl /usr/bin/kbuectl && \
	gcloud -q components install core gsutil bq app-engine-python kubectl beta && \
	wget -q 'https://bootstrap.pypa.io/get-pip.py' -O get-pip.py && \
	python get-pip.py && \
	rm get-pip.py && \
	pip install \
		kubernetes \
		oauth2client \
		google-api-python-client \
		Jinja2 \
		google-api-helper \
		protobuf

ENV PATH="/usr/local/google-cloud-sdk/bin:${PATH}"
# VOLUME ["/root/.config"]
