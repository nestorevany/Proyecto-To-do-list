

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
String descripcion=request.getParameter("txttdescripcion");
String codigo_seccion=request.getParameter("se_codigo");
String titulopro=request.getParameter("txtptitulo");
String titulosec=request.getParameter("txtsdescripcion");
String codigo_proyecto=request.getParameter("p_codigo");

stmt.executeUpdate("insert into tareas (ta_descripcion, se_codigo) values('"+descripcion+"','"+codigo_seccion+"')");  

 //insertar en Bitacora
        try {
                            dba db2 = new dba();
                            db2.Conectar();
                            String detalle = "Agregar Tarea";
                            String descripcion1=request.getParameter("txttdescripcion");
                            
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
        



response.sendRedirect("proyectos.jsp?p_codigo="+codigo_proyecto+"&p_titulo="+titulopro+"&se_codigo="+codigo_seccion+"&s_descripcion="+titulosec+"");
con.close();
stmt.close();
Thread.sleep(1000);
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} %>

   <script>
         alert("Tareas Creado");
         
     </script>
        
        