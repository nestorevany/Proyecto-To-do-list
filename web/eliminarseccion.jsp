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
                    contador1 = db.query.executeUpdate("DELETE FROM secciones "
                                        + "WHERE se_codigo = '"+request.getParameter("se_codigo")+"'");
                    {
                        out.print("<script>alert('Registro Eliminado');</script>");
                   }
                    
                   //db.commit();
                   db.desconectar();
                   response.sendRedirect("proyectos.jsp?p_codigo="+request.getParameter("p_codigo")+"&p_titulo="+request.getParameter("p_titulo")+"");
               } catch (Exception e) {
                   e.printStackTrace();
               }
   
      //insertar en Bitacora
        try {
                            dba db2 = new dba();
                            db2.Conectar();
                            String detalle = "Eliminar Seccion";
                            String eliminarseccion=request.getParameter("p_titulo");
                            
                           db2.query.executeUpdate("insert into bitacoras "
                                        + "(bi_usuario, bi_nombreusuario, bi_detalle,bi_operacion,bi_fecha)"
                                       + "values('"+ session.getAttribute("ucodigo")+"'"
                                       + ",'"+ session.getAttribute("unombre")+"'"  
                                       + ",'"+ detalle+"'" 
                                       + ",'"+ eliminarseccion+"'"           
                                       + ", SYSDATE )");
                            
                            db2.commit();
                            db2.desconectar();
                        } catch (Exception e) {
                            out.print(e);
                        }
         //fin bitacora           
            
        %>   
