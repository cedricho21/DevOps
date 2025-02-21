node_name = "db"
server = false
datacenter = "dc1"
data_dir = "/opt/consul"
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
advertise_addr = "192.168.56.13"
retry_join = ["192.168.56.11"]

service {
  name = "db"
  port = 5432
  connect {
    sidecar_service {
      proxy {
        upstreams = [
          {
            destination_name = "api"
            local_bind_port = 8082
          }
        ]
      }
    }
  }
}

