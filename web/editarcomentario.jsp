<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

<%
 try
{   
 //MODIFICAR un producto   
        String cocodigo=request.getParameter("txtcomcodigo");  
        String coescripcion=request.getParameter("txtcomentarios");
        String cousuario=request.getParameter("txtusunombre");
        
        String tacodigo=request.getParameter("txttacodigo");
        
        String tadescripcion=request.getParameter("txttacomentarios");

        
        Connection con;
        PreparedStatement pst;
        ResultSet rs; 
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
        pst=con.prepareStatement("update comentarios set com_descripcion = ?, com_usuario=?,cod_Tarea=? where com_codigo = ?");
        pst.setString(1, coescripcion);
        pst.setString(2, cousuario);
        pst.setString(3, tacodigo);
        pst.setString(4, cocodigo);
        pst.executeUpdate();              

    response.sendRedirect("comentarios.jsp?ta_codigo="+tacodigo+"&ta_descripcion="+tadescripcion+"");
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


