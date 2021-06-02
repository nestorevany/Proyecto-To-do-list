

<%@page import="java.sql.ResultSet"%>
<%@page import="database.dba"%>



<!DOCTYPE html>
<html>
    <head>
        <title>Manejo de Mapas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
        
        <script type="text/javascript">
            function mostrar_mapa(centinela){
                //Ubicación inicial del mapa.
                var ubicacion = new google.maps.LatLng(14.6203, -87.644); //Latitud y Longitud
                //Parámetros Iniciales
                var opciones={zoom:7, //acercamiento
                    center: ubicacion,
                    mapTypeId: google.maps.MapTypeId.ROADMAP //Las posibles opciones son ROADMAP/SATELLITE/HYBRID/TERRA                    
                };
            
                //Creación del mapa
                var map = new google.maps.Map(document.getElementById("mapa"),opciones);

                if (centinela==1){
                    //Colocar una marca sobre el Mapa
                    <%
        
        try {
                
                dba db = new dba();
                db.Conectar();
                db.query.execute("select usu_nombre, ubicacion from usuarios ");
                ResultSet rs=db.query.getResultSet();
                               
                while(rs.next()){ 
                    String nombre=rs.getString(1);
                    String ubicacion=rs.getString(2);
                    %>
                     mi_ubicacion = new google.maps.Marker({
                       position: new google.maps.LatLng(<%=ubicacion%>),//posicion del usuario
                       icon: 'persona.jpg', //Imagen para mostrar la ubicacion
                       map: map, //Mapa creado
                       title: '<%=nombre%>' //nombre que muestra google map
                    });

                    //Mostrar Información al hacer click en la marca
                    var infowindow = new google.maps.InfoWindow({
                        content: 'Elaborado Por: Nestor Velasquez<br/>Clase: Desarrollo de Aplicaciones<br/>Tipo: Proyecto Final'
                    });

                    google.maps.event.addListener(mi_ubicacion, 'click',function(){
                        //clic mostrar lista
                       infowindow.open(map, mi_ubicacion);
                    });
                    
                    <%
                }
                db.desconectar();                         
                
            } catch (Exception e) {
                e.printStackTrace();
            }
       
        %>
                };
            }       
            function mostrar_triangulo(){
                //Ubicación inicial del mapa
                var ubicacion = new google.maps.LatLng(24.886436490187712, -70.2685546875);
                //Parámetros iniciales
                var opciones = {zoom: 5,
                    center: ubicacion,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                var map = new google.maps.Map(document.getElementById("mapa"),opciones);
                var bermudaTriangle;
                var triangleCoords = [
                    new google.maps.LatLng(25.774252, -80.190262),
                    new google.maps.LatLng(18.466465, -66.118292),
                    new google.maps.LatLng(32.321384, -64.75737),
                    new google.maps.LatLng(25.774252, -80.190262),
                ];
                
                //Crear Polígono
                bermudaTriangle = new google.maps.Polygon({
                    paths: triangleCoords,
                    strokeColor: "#FF0000",
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillColor:"FF0000",
                    fillOpacity: 0.35
                });
                
                bermudaTriangle.setMap(map);
                
                //Para crear líneas se hace lo siguiente
                //1.- Se crea un arreglo de coordenadas por donde pasará la línea
                //2.- var linea = new google.maps.Polyline({
                //      path: arregloCoordenadas,
                //      strokeColor: "#FF0000",
                //      strokeOpacity: 1.0,
                //      strokeWeight:2
                //    )};
                //linea.setMap(map);

            }
            
            
        </script>       
    </head>
    <center>
        <body onload="mostrar_mapa(0)">
            <div id="mapa" style="width: 900px; height: 500px; border: 5px groove #006600;"></div>
            <input type="button" value="Ubicacion de Usuarios" onclick="mostrar_mapa(1)"/>
            <input type="button" value="Tri�ngulo de las Bermudas" onclick="mostrar_triangulo()"/>
            <input type="button" value="Limpiar ubicaci�n" onclick="mostrar_mapa(0)"/>
            <a href="inicio.jsp">Regresar a Inicio</a>
        </body>
    </center>
</html>
