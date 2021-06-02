<%-- 
    Document   : eliminartarea
    Created on : Jun 15, 2020, 11:52:48 PM
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
                    contador1 = db.query.executeUpdate("DELETE FROM comentarios "
                                        + "WHERE com_codigo = '"+request.getParameter("com_codigo")+"'");
                    {
                        out.print("<script>alert('Registro Eliminado');</script>");
                   }
                    
                   //db.commit();
                   db.desconectar();
                   response.sendRedirect("comentarios.jsp?ta_codigo="+request.getParameter("ta_codigo")+"&ta_descripcion="+request.getParameter("ta_descripcion")+"");
               } catch (Exception e) {
                   e.printStackTrace();
               }
            
            
        %>   

