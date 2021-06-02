<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

<%
 try
{   
 //MODIFICAR un producto   
        String sucodigo=request.getParameter("txtsubcodigo");  
        String sudescripcion=request.getParameter("txtsubdescripcion");
        String tacodigo=request.getParameter("txttacodigo");
        
        String tadescripcion=request.getParameter("txttadescripcion");

        
        Connection con;
        PreparedStatement pst;
        ResultSet rs; 
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
        pst=con.prepareStatement("update sub_tareas set sub_descripcion = ?, ta_codigo=? where sub_codigo = ?");
        pst.setString(1, sudescripcion);
        pst.setString(2, tacodigo);
        pst.setString(3, sucodigo);
        pst.executeUpdate();              

    response.sendRedirect("subtareas.jsp?ta_codigo="+tacodigo+"&ta_descripcion="+tadescripcion+"");
    con.close();   
    Thread.sleep(1000);
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} %>

     <script>
         alert("Registro Actualizado");
         
     </script>

