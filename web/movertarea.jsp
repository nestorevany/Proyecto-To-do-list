

<%@page language="java" import="util.EnviarEmail,java.util.*, java.sql.*"%>
<%@page import="java.io.*"%>

<%
try
{
ResultSet rs =null;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
Statement stmt=con.createStatement();
String descripcion=request.getParameter("ta_descripcion");
String codigo_seccion=request.getParameter("s_codigo");
//String titulopro=request.getParameter("txtptitulo");
//String titulosec=request.getParameter("txtsdescripcion");
String codigo_tarea=request.getParameter("ta_codigo");

stmt.executeUpdate("insert into tareas (ta_descripcion, se_codigo) values('"+descripcion+"','"+codigo_seccion+"')");  
    
response.sendRedirect("eliminartareamovida.jsp?ta_codigo="+codigo_tarea+"");
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
        
        