<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

<%
 try
{   
 //MODIFICAR un producto   
        String codigo=request.getParameter("txttcodigo");  
        String descripcion=request.getParameter("txttnombre");
        String scodigo=request.getParameter("txtscodigo");
        String titulopro=request.getParameter("txtptitulo");
        String codigo_proyecto=request.getParameter("txtpcodigo");
        String titulosec=request.getParameter("txtsdescripcion");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs; 
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
        pst=con.prepareStatement("update tareas set ta_descripcion = ?, se_codigo=? where ta_codigo = ?");
        pst.setString(1, descripcion);
        pst.setString(2, scodigo);
        pst.setString(3, codigo);
        pst.executeUpdate();              

 //insertar en Bitacora
        try {
                            dba db2 = new dba();
                            db2.Conectar();
                            String detalle = "Editar Tarea";
                           String descripcion1=request.getParameter("txttnombre");
                            
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
        
        
        
        
    response.sendRedirect("proyectos.jsp?p_codigo="+codigo_proyecto+"&p_titulo="+titulopro+"&se_codigo="+scodigo+"&s_descripcion="+titulosec+"");
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
