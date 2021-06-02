<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Importa las librerias de jQuery y las de Highcharts -->
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/highcharts.js"></script>
        <script type="text/javascript" src="js/exporting.js"></script>
        
        
    <script type="text/javascript">
                    
		
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'graficaCircular'
					},
					title: {
						text: 'Proyectos por Usuarios'
					},
					
                                        
					plotArea: {
						shadow: null,
						borderWidth: null,
						backgroundColor: null
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.point.name +'</b>: '+ this.y;
						}
					},
					plotOptions: {
						pie: {
							allowPointSelect: true,
							cursor: 'pointer',
							dataLabels: {
								enabled: true,
								color: '#000000',
								connectorColor: '#000000',
								formatter: function() {
									return '<b>'+ this.point.name +'</b>: '+ this.y;
								}
							}
						}
					},
				    series: [{
						type: 'pie',
						name: 'Browser share',
						data: [
                                                    <%
                                                        //Connection con = null;

                                                        //Statement st = null;
                                                        try {
                                                            dba db = new dba();
                                                            db.Conectar();
                                                            // VEHICULOS MÁS PUBLICADOS
                                                            db.query.execute("select usu_nombre, COUNT(*) AS num_proyectos  from proyectos, usuarios where proyectos.usu_codigo=usuarios.usu_codigo group by usu_nombre  ");
                                                                    
                                                            ResultSet rs = db.query.getResultSet();
                                                            while (rs.next()) {
                                                                
                                                                out.print("['"+rs.getString("usu_nombre")+"',"+rs.getString("num_proyectos")+"],");

                        
                                                    %>
                                                    <%
                                                        }                   
                                                        db.desconectar();
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>  
                                                    
								
								
							]
					}]
				});
			});
                        
				
		</script>      

        
    </head>
    <body>
        <a href="graficos.jsp">Regresar al Menu</a>
        <a href="./graficos.jsp">
        <picture id="wb_Picture1" style="position:absolute;left:5px;top:70px;width:77px;height:78px;z-index:1">
            <img src="imagen/atrass.png" id="Picture1" alt="" srcset="">
        </picture>
       
    </a>
            	
            <div id="graficaCircular" style="width: 100%; height: 500px; margin: 0 auto"></div>	
            
           
    </body>
    
</html>
