FROM envoyproxy/envoy-alpine:v1.21.6

# install required packages
RUN apk add --no-cache curl gzip wget

# download Consul binary
RUN curl -sL https://releases.hashicorp.com/consul/1.14.2/consul_1.14.2_linux_amd64.zip | zcat  >> /usr/local/bin/consul && \
	chmod +x /usr/local/bin/consul

# download fake-service binary
RUN curl -sL https://github.com/nicholasjackson/fake-service/releases/download/v0.24.2/fake_service_linux_amd64.zip | zcat > /usr/local/bin/fake-service && \
	chmod +x /usr/local/bin/fake-service

# download dumb-init
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/local/bin/dumb-init

# copy entrypoint
COPY ./entrypoint.sh .

ENTRYPOINT [ "dumb-init", "--" ]
CMD [ "sh", "entrypoint.sh" ]
