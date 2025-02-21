node_name = "api"
server = false
datacenter = "dc1"
data_dir = "/opt/consul"
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
advertise_addr = "192.168.56.12"
retry_join = ["192.168.56.11"]
ui = true
service {
  name = "api"
  port = 8082

  connect {
    sidecar_service {
      proxy {
        upstreams = [
          {
            destination_name = "db"
            local_bind_port = 5432
          }
        ]
      }
    }
  }
}

