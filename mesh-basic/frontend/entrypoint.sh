#! /bin/sh

set -e

# run frontend service in the background
echo "Starting frontend service..."
LISTEN_ADDR=0.0.0.0:9091 NAME=frontend UPSTREAM_URIS=localhost:5000 /usr/local/bin/fake-service &

# start Consul in the background
echo "Starting Consul..."
consul agent -config-dir=/consul/config >/var/log/consul.log 2>&1 &

sleep 5

# run the frontend Envoy sidecar
echo "Starting frontend Envoy sidecar..."
/usr/local/bin/consul connect envoy -sidecar-for=frontend -admin-bind=0.0.0.0:19000 -- -l debug >/var/log/envoy-frontend.log 2>&1 &

# good night!
sleep infinity
