<%@page import="java.sql.ResultSet"%>
<%@page import="database.dba"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Graficas Ejemplo</title>
		
		<!-- Importa las librerias de jQuery y las de Highcharts -->
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/highcharts.js"></script>
		<script type="text/javascript" src="js/exporting.js"></script>
		
                
                <%
            String usuario="", numero="",vtes="",pag="";
            try {
                
                dba db = new dba();
                db.Conectar();
                db.query.execute("select usu_nombre, COUNT(*) AS num_proyectos  from proyectos, usuarios where proyectos.usu_codigo=usuarios.usu_codigo group by usu_nombre ");
                ResultSet rs=db.query.getResultSet();
                               
                while(rs.next()){ 
                    usuario+="'"+rs.getString(1)+"',";
                    numero+=""+rs.getString(2)+",";
                
                }
                db.desconectar();
                //quitar la ultima coma de las cadenas
                usuario=usuario.substring(0, usuario.length()-1);
                numero=numero.substring(0, numero.length()-1);
              
                
            } catch (Exception e) {
                e.printStackTrace();
            }

            

        %>

                
                
                
		<!-- Creo la gráfica -->
		<script type="text/javascript">
			var chart;
			$(document).ready(function() {

				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'graficaLineal', 	// Le doy el nombre a la gráfica
						defaultSeriesType: 'line'	// Pongo que tipo de gráfica es
					},
					title: {
						text: 'Proyectos por usuario'	// Titulo (Opcional)
					},
					subtitle: {
						text: 'Todoist'				// Subtitulo (Opcional)
					},
					// Pongo los datos en el eje de las 'X'
					xAxis: {
						categories: [<%=usuario%>],
						// Pongo el título para el eje de las 'X'
						title: {
							text: 'Usuarios'
						}
					},
					yAxis: {
						// Pongo el título para el eje de las 'Y'
						title: {
							text: 'Nº de Proyectos'
						}
					},
					// Doy formato al la "cajita" que sale al pasar el ratón por encima de la gráfica
					tooltip: {
						enabled: true,
						formatter: function() {
							return '<b>'+ this.series.name +'</b><br/>'+
								this.x +': '+ this.y +' '+this.series.name;
						}
					},
					// Doy opciones a la gráfica
					plotOptions: {
						line: {
							dataLabels: {
								enabled: true
							},
							enableMouseTracking: true
						}
					},
					// Doy los datos de la gráfica para dibujarlas
					series: [{
                            name: 'Nombre del Usuario',
                            //poner visitas desde la base de datos
                            data: [<%=numero%>]
                        }],
				});
		});
				
		</script>
		
	</head>
	<body>
             <a href="graficos.jsp">Regresar a Menu</a>
		<!-- "Llamo" a la gráfica y la pinto en el cuerpo de la página -->
		<div id="graficaLineal" style="width: 100%; height: 500px; margin: 0 auto"></div>
               
	</body>
</html>

