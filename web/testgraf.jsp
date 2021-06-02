<%@page import="java.sql.ResultSet"%>
<%@page import="database.dba"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Base de Datos y Grafica</title>

        <!-- Importa las librerias de jQuery y las de Highcharts -->
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/highcharts.js"></script>
        <script type="text/javascript" src="js/exporting.js"></script>


        <%
            String mes="", vta="",vtes="",pag="";
            try {
                
                 dba db = new dba();
               db.Conectar();
                db.query.execute("select mes, visitas, visitantes, paginas from estadistica");
                ResultSet rs=db.query.getResultSet();
                               
                while(rs.next()){ 
                    mes+="'"+rs.getString(1)+"',";
                    vta+=""+rs.getString(2)+",";
                    vtes+=""+rs.getString(3)+",";
                    pag+=""+rs.getString(4)+",";                    
                }
                db.desconectar();
                //quitar la ultima coma de las cadenas
                mes=mes.substring(0, mes.length()-1);
                vta=vta.substring(0, vta.length()-1);
                vtes=vtes.substring(0, vtes.length()-1);
                pag=pag.substring(0, pag.length()-1);                
                
            } catch (Exception e) {
                e.printStackTrace();
            }

            

        %>



        <!-- Creo la gr�fica -->
        <script type="text/javascript">
            var chart;
            $(document).ready(function () {

                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'graficaLineal', // Le doy el nombre a la gr�fica
                        type: 'column'  // Pongo que tipo de gr�fica es
                    },
                    title: {
                        text: 'Estasdisticas'	// Titulo (Opcional)
                    },
                    subtitle: {
                        text: 'Vanguardia'				// Subtitulo (Opcional)
                    },
                    // Pongo los datos en el eje de las 'X'
                    xAxis: {
                        //poner los meses recuperados de la base de datos
                        categories: [<%=mes%>],
                        // Pongo el t�tulo para el eje de las 'X'
                        title: {
                            text: 'Meses'
                        }
                    },
                    yAxis: {
                        // Pongo el t�tulo para el eje de las 'Y'
                        title: {
                            text: 'N� Visitas'
                        }
                    },
                    // Doy formato al la "cajita" que sale al pasar el rat�n por encima de la gr�fica
                    tooltip: {
                        enabled: true,
                        formatter: function () {
                            return '<b>' + this.series.name + '</b><br/>' +
                                    this.x + ': ' + this.y + ' ' + this.series.name;
                        }
                    },
                    // Doy opciones a la gr�fica
                    plotOptions: {
                        line: {
                            dataLabels: {
                                enabled: true
                            },
                            enableMouseTracking: true
                        }
                    },
                    // Doy los datos de la gr�fica para dibujarlas
                    series: [{
                            name: 'Visitas',
                            //poner visitas desde la base de datos
                            data: [<%=vta%>]
                        },
                        {
                            name: 'Visitantes �nicos',
                            data: [<%=vtes%>]
                        },
                        {
                            name: 'P�ginas Vistas',
                            data: [<%=pag%>]
                        }],
                });


            });

        </script>

    </head>
    <body>
                
        <!-- "Llamo" a la gr�fica y la pinto en el cuerpo de la p�gina -->
        <div id="graficaLineal" style="width: 100%; height: 500px; margin: 0 auto"></div>		
    </body>
    
</html>
