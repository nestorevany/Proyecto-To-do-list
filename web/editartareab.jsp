<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

<%
 try
{   
 //MODIFICAR un producto   
        String codigo=request.getParameter("txttcodigo");  
        String descripcion=request.getParameter("txttnombre");
        String spcodigo=request.getParameter("txtscodigo");
        String titulopro=request.getParameter("txtsdescripcion");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs; 
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
        pst=con.prepareStatement("update ta_secciones set set_descripcion = ?, proyt_codigo=? where set_codigo = ?");
        pst.setString(1, descripcion);
        pst.setString(2, spcodigo);
        pst.setString(3, codigo);
        pst.executeUpdate();              

    response.sendRedirect("mibandeja.jsp?s_codigo="+spcodigo+"&s_descripcion="+titulopro+"");
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
