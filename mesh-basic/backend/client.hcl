node_name   = "consul-backend-client"
data_dir    = "/var/lib/consul"
bind_addr   = "0.0.0.0"
client_addr = "0.0.0.0"
log_level   = "DEBUG"

retry_join = ["consul-server"]

connect {
  enabled = true
}

ports {
  grpc = 8502
}