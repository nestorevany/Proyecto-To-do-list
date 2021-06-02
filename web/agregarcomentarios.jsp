

<%@page language="java" import="util.EnviarEmail,java.util.*, java.sql.*"%>
<%@page import="java.io.*"%>

<%
try
{
ResultSet rs =null;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
Statement stmt=con.createStatement();
String descripcion=request.getParameter("txtcomentarios");
String usuario=request.getParameter("txtusunombre");

String ta_codigo=request.getParameter("txttcodigo");
String tadescripcion=request.getParameter("txttadescripcion");


stmt.executeUpdate("insert into comentarios (com_descripcion, com_usuario, cod_Tarea) values('"+descripcion+"','"+usuario+"','"+ta_codigo+"')");  

response.sendRedirect("comentarios.jsp?ta_codigo="+ta_codigo+"&ta_descripcion="+tadescripcion+"");

con.close();
stmt.close();
Thread.sleep(1000);
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} %>

   <script>
         alert("Comentario Agregado");
         
     </script>
        
        
