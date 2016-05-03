include "server_iface.iol"

outputPort Server {
Location: "socket://localhost:8080"
Protocol: soap
Interfaces: MyIface
}
