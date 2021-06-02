<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

<%
 try
{   
 //MODIFICAR un producto   
        String codigo=request.getParameter("txtscodigo");  
        String descripcion=request.getParameter("txtsnombre");
        String spcodigo=request.getParameter("txtpcodigo");
        String titulopro=request.getParameter("txtptitulo");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs; 
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
        pst=con.prepareStatement("update secciones set se_descripcion = ?, proy_codigo=? where se_codigo = ?");
        pst.setString(1, descripcion);
        pst.setString(2, spcodigo);
        pst.setString(3, codigo);
        pst.executeUpdate();              

//insertar en Bitacora
        try {
                            dba db2 = new dba();
                            db2.Conectar();
                            String detalle = "Editar Seccion";
                            String descripcion1=request.getParameter("txtsnombre");
                            
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
        
        
    response.sendRedirect("proyectos.jsp?p_codigo="+spcodigo+"&p_titulo="+titulopro+"");
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