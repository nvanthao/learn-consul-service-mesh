service {
  name = "frontend"
  port = 9091

  connect {
    sidecar_service {
      proxy {
        upstreams = [
          {
            destination_name = "backend"
            local_bind_port  = 5000
          }
        ]
      }
    }
  }

  check {
    id       = "frontend-check"
    http     = "http://localhost:9091/health"
    method   = "GET"
    interval = "1s"
    timeout  = "1s"
  }
}
