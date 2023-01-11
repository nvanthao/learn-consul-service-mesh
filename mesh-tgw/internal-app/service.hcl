service {
  name = "internal-app"
  port = 9091

  connect {
    sidecar_service {
      proxy {
        upstreams = [
          {
            destination_name = "external-app"
            local_bind_port  = 5000
          }
        ]
      }
    }
  }

  check {
    id       = "internal-app-check"
    http     = "http://localhost:9091/health"
    method   = "GET"
    interval = "1s"
    timeout  = "1s"
  }
}
