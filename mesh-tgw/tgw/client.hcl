node_name = "consul-tgw-client"
data_dir  = "/var/lib/consul"
bind_addr = "10.5.0.3"
log_level = "DEBUG"

retry_join = ["consul-server"]

connect {
  enabled = true
}

ports {
  grpc = 8502
}