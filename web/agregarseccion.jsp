

<%@page language="java" import="util.EnviarEmail,java.util.*, java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>
<%
try
{
ResultSet rs =null;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
Statement stmt=con.createStatement();
String descripcion=request.getParameter("txtnseccion");
String codigo_proyecto=request.getParameter("p_codigo");
String titulopro=request.getParameter("txtptitulo");

stmt.executeUpdate("insert into secciones (se_descripcion, proy_codigo) values('"+descripcion+"','"+codigo_proyecto+"')");  

//insertar en Bitacora
        try {
                            dba db2 = new dba();
                            db2.Conectar();
                            String detalle = "Agregar Seccion";
                            String descripcion1=request.getParameter("txtnseccion");
                            
                           db2.query.executeUpdate("insert into bitacoras "
                                        + "(bi_usuario, bi_nombreusuario, bi_detalle,bi_operacion,bi_fecha)"
                                       + "values('"+ session.getAttribute("ucodigo")+"'"
                                       + ",'"+ session.getAttribute("unombre")+"'"  
                                       + ",'"+ detalle+"'" 
                                       + ",'"+ descripcion1+"'"           
                                       + ", SYSDATE )");
                            
                            db2.commit();
                            db2.desconectar();
                        } catch (Exception e) {
                            out.print(e);
                        }
         //fin bitacora


    
response.sendRedirect("proyectos.jsp?p_codigo="+codigo_proyecto+"&p_titulo="+titulopro+"");
con.close();
stmt.close(); 
Thread.sleep(1000);
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} 


%>

   <script>
         alert("Seccion Creado");
         
     </script>

        
        