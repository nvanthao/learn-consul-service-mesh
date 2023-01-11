server      = true
bootstrap   = true
node_name   = "consul-server"
data_dir    = "/var/lib/consul"
bind_addr   = "0.0.0.0"
client_addr = "0.0.0.0"
log_level   = "DEBUG"

ui_config {
  enabled = true
}

connect {
  enabled = true
}