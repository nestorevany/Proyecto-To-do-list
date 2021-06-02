

<%@page language="java" import="util.EnviarEmail,java.util.*, java.sql.*"%>
<%@page import="java.io.*"%>

<%
try
{
ResultSet rs =null;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
Statement stmt=con.createStatement();
String descripcion=request.getParameter("txttdescripcion");
String codigo_seccion=request.getParameter("s_codigo");
String titulopro=request.getParameter("txtsdescripcion");

stmt.executeUpdate("insert into ta_secciones (set_descripcion, proyt_codigo) values('"+descripcion+"','"+codigo_seccion+"')");  
    
response.sendRedirect("mibandeja.jsp?s_codigo="+codigo_seccion+"&s_descripcion="+titulopro+"");
con.close();
stmt.close(); 
Thread.sleep(1000);
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} %>

   <script>
         alert("Tarea Creado");
         
     </script>

        
        
