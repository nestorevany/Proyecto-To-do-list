<%-- 
    Document   : eliminarproyecto
    Created on : Jun 15, 2020, 8:12:09 PM
    Author     : Nestor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>
<!DOCTYPE html>

    <%//ELIMINAR
  
        
        
                try {
                   dba db = new dba();
                db.Conectar();                
                    int contador1;
                    contador1 = db.query.executeUpdate("DELETE FROM proyecto_secciones "
                                        + "WHERE proys_codigo = '"+request.getParameter("s_codigo")+"'");
                    {
                        out.print("<script>alert('Registro Eliminado');</script>");
                   }
                    
                   //db.commit();
                   db.desconectar();
                   response.sendRedirect("mibandeja.jsp");
               } catch (Exception e) {
                   e.printStackTrace();
               }
            
            
        %>   

