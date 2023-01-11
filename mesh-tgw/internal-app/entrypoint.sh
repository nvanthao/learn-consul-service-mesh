#! /bin/sh

set -e

echo "Starting internal app..."
LISTEN_ADDR=0.0.0.0:9091 NAME=internal-app UPSTREAM_URIS=localhost:5000 /usr/local/bin/fake-service &

# start Consul in the background
echo "Starting Consul..."
consul agent -config-dir=/consul/config >/var/log/consul.log 2>&1 &

sleep 5

# run the internal app Envoy sidecar
echo "Starting internal app Envoy sidecar..."
/usr/local/bin/consul connect envoy -sidecar-for=internal-app -admin-bind=0.0.0.0:19000 -- -l debug >/var/log/envoy-internal-app.log 2>&1 &

# good night!
sleep infinity
