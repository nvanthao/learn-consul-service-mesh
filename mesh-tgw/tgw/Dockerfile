FROM envoyproxy/envoy-alpine:v1.21.6

# install required packages
RUN apk add --no-cache curl gzip wget

# download Consul binary
RUN curl -sL https://releases.hashicorp.com/consul/1.14.2/consul_1.14.2_linux_amd64.zip | zcat  >> /usr/local/bin/consul && \
	chmod +x /usr/local/bin/consul

# download dumb-init
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/local/bin/dumb-init

COPY ./entrypoint.sh .

ENTRYPOINT [ "dumb-init", "--" ]
CMD [ "sh", "entrypoint.sh" ]
