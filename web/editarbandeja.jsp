<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

<%
 try
{   
 //MODIFICAR un producto   
        String codigop=request.getParameter("txtscodigo");  
        String titulop=request.getParameter("txtsnombre");
        String codigou=request.getParameter("txtpcodigo");

        
        Connection con;
        PreparedStatement pst;
        ResultSet rs; 
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
        pst=con.prepareStatement("update proyecto_secciones set proys_titulo = ?, usus_codigo=? where proys_codigo = ?");
        pst.setString(1, titulop);
        pst.setString(2, codigou);
        pst.setString(3, codigop);
        pst.executeUpdate();              

    response.sendRedirect("mibandeja.jsp");
    con.close();   
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} %>

     <script>
         alert("Registro Actualizado");
         
     </script>

