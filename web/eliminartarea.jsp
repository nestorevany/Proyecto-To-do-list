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
                    contador1 = db.query.executeUpdate("DELETE FROM tareas "
                                        + "WHERE ta_codigo = '"+request.getParameter("ta_codigo")+"'");
                    {
                        out.print("<script>alert('Registro Eliminado');</script>");
                   }
                    
                   //db.commit();
                   db.desconectar();
                 
               } catch (Exception e) {
                   e.printStackTrace();
               }
    //insertar en Bitacora
        try {
                            dba db2 = new dba();
                            db2.Conectar();
                            String detalle = "Eliminar Tarea";
                            String eliminart=request.getParameter("s_descripcion");
                            
                           db2.query.executeUpdate("insert into bitacoras "
                                        + "(bi_usuario, bi_nombreusuario, bi_detalle,bi_operacion,bi_fecha)"
                                       + "values('"+ session.getAttribute("ucodigo")+"'"
                                       + ",'"+ session.getAttribute("unombre")+"'"  
                                       + ",'"+ detalle+"'" 
                                       + ",'"+ eliminart+"'"           
                                       + ", SYSDATE )");
                            
                            db2.commit();
                            db2.desconectar();
                        } catch (Exception e) {
                            out.print(e);
                        }
         //fin bitacora        
   response.sendRedirect("proyectos.jsp?p_codigo="+request.getParameter("p_codigo")+"&p_titulo="+request.getParameter("p_titulo")+"&se_codigo="+request.getParameter("se_codigo")+"&s_descripcion="+request.getParameter("s_descripcion")+"");           
        %>   
