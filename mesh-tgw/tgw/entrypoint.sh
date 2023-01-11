#! /bin/sh

set -e

# start Consul in the background
echo "Starting Consul..."
consul agent -config-dir=/consul/config >/var/log/consul.log 2>&1 &

sleep 5

# register the external app
consul services register -id external-app -name external-app -address 10.6.0.2 -port 9090 -meta 'external-node=true' -meta 'external-probe=true'

# configure terminating gateway
echo '
Kind = "terminating-gateway"
Name = "my-gateway"
Services = [
 {
   Name = "external-app"
 }
]
' | consul config write -

sleep 5

# start terminating gateway
consul connect envoy -gateway=terminating -register -service my-gateway -address '10.5.0.3:8443' -admin-bind=0.0.0.0:19001 >/var/log/terminating_gateway.log 2>&1 &

# good night!
sleep infinity
