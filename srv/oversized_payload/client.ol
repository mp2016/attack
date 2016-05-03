include "server.iol"
include "console.iol"

main
{
  request << {
    .x = int( args[0] ),
    .y = int( args[1] )
  };

  opUntyped@Server( request )( response );
  println@Console( "Untyped: " + response.result )();
  opTyped@Server( request )( response );
  println@Console( "Typed: " + response.result )()
}
