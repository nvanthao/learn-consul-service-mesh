service {
  name = "backend"
  port = 9090

  connect {
    sidecar_service {}
  }

  check {
    id       = "backend-check"
    http     = "http://localhost:9090/health"
    method   = "GET"
    interval = "1s"
    timeout  = "1s"
  }
}
