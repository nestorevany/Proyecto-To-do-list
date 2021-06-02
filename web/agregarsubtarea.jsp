

<%@page language="java" import="util.EnviarEmail,java.util.*, java.sql.*"%>
<%@page import="java.io.*"%>

<%
try
{
ResultSet rs =null;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
Statement stmt=con.createStatement();
String subdescripcion=request.getParameter("txtsubdescripcion");
String ta_codigo=request.getParameter("txttacodigo");

 String tadescripcion=request.getParameter("txttadescripcion");

stmt.executeUpdate("insert into sub_tareas (sub_descripcion, ta_codigo) values('"+subdescripcion+"','"+ta_codigo+"')");  
    
response.sendRedirect("subtareas.jsp?ta_codigo="+ta_codigo+"&ta_descripcion="+tadescripcion+"");
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
        
        
