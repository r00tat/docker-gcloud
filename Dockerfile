FROM paulwoelfel/debian-docker
MAINTAINER github@frig.at

RUN echo "deb https://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && apt-get -y install google-cloud-sdk google-cloud-sdk-app-engine-python kubectl && rm -rf /var/lib/apt/lists/*

VOLUME ["/.config"]
