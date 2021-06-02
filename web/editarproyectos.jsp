<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

<%
 try
{   
 //MODIFICAR un producto   
        String codigop=request.getParameter("txtcodigop");  
        String titulop=request.getParameter("txttitulop");
        String codigou=request.getParameter("txtcodigou");

        
        Connection con;
        PreparedStatement pst;
        ResultSet rs; 
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
        pst=con.prepareStatement("update proyectos set proy_titulo = ?, usu_codigo=? where proy_codigo = ?");
        pst.setString(1, titulop);
        pst.setString(2, codigou);
        pst.setString(3, codigop);
        pst.executeUpdate();              

    response.sendRedirect("proyectos.jsp?p_codigo="+codigop+"&p_titulo="+titulop+"");
    con.close();   
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} 
 //insertar en Bitacora
        try {
                            dba db2 = new dba();
                            db2.Conectar();
                            String detalle = "Editar Proyecto";
                            String titulop1=request.getParameter("txttitulop");
                            
                           db2.query.executeUpdate("insert into bitacoras "
                                        + "(bi_usuario, bi_nombreusuario, bi_detalle,bi_operacion,bi_fecha)"
                                       + "values('"+ session.getAttribute("ucodigo")+"'"
                                       + ",'"+ session.getAttribute("unombre")+"'"  
                                       + ",'"+ detalle+"'" 
                                       + ",'"+ titulop1+"'"           
                                       + ", SYSDATE )");
                            
                            db2.commit();
                            db2.desconectar();
                        } catch (Exception e) {
                            out.print(e);
                        }
         //fin bitacora
        
%>

     <script>
         alert("Registro Actualizado");
         
     </script>
