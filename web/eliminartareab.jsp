<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <%//ELIMINAR
  
        
        
                try {
                   dba db = new dba();
                db.Conectar();                
                    int contador1;
                    contador1 = db.query.executeUpdate("DELETE FROM ta_secciones "
                                        + "WHERE set_codigo = '"+request.getParameter("ta_codigo")+"'");
                    {
                        out.print("<script>alert('Registro Eliminado');</script>");
                   }
                    
                   //db.commit();
                   db.desconectar();
                   response.sendRedirect("mibandeja.jsp?s_codigo="+request.getParameter("s_codigo")+"&s_descripcion="+request.getParameter("s_descripcion")+"");
               } catch (Exception e) {
                   e.printStackTrace();
               }
            
            
        %>   

