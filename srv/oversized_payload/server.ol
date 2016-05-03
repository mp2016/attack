include "server.iol"

execution { concurrent }

inputPort Server {
Location: "socket://localhost:8080"
Protocol: soap
Interfaces: MyIface
}

define calculate
{
  response.result = request.x + request.y
}

main
{
  [ opUntyped( request )( response ) {
    calculate
  } ]

  [ opTyped( request )( response ) {
    calculate
  } ]
}
