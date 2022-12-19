#! /bin/sh

set -e

# run backend service in the background
echo "Starting backend service..."
LISTEN_ADDR=0.0.0.0:9090 NAME=backend /usr/local/bin/fake-service &

# start Consul in the background
echo "Starting Consul..."
consul agent -config-dir=/consul/config >/var/log/consul.log 2>&1 &

sleep 5

# run the backend Envoy sidecar
echo "Starting backend Envoy sidecar..."
/usr/local/bin/consul connect envoy -sidecar-for=backend -admin-bind=0.0.0.0:19000 -- -l debug >/var/log/envoy-backend.log 2>&1 &

# good night!
sleep infinity
