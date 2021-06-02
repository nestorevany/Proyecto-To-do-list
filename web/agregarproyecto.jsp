<%-- 
    Document   : agregarproyecto
    Created on : Jun 20, 2020, 8:39:20 PM
    Author     : Nestor
--%>
﻿<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%//INSERT PROYECTOS
        String usucodigo=request.getParameter("txtcodigousuario");
        String protitulo=request.getParameter("ti_nombre");
                
        
        
        try{
                dba db = new dba();
                db.Conectar();
                
                db.query.executeUpdate("insert into proyectos "
                                        + "(usu_codigo, proy_titulo)"
                                       + "values('"+ usucodigo+"'"       
                                       + ",'"+ protitulo+"')");
            
                
                out.print("<script>alert('Seccion creado ');</script>");
                //db.commit();
                db.desconectar();
                //Thread.sleep(1000);
            }catch(Exception e){
                e.printStackTrace();
            }
        
      //insertar en Bitacora
        try {
                            dba db2 = new dba();
                            db2.Conectar();
                            String detalle = "Agregar Proyecto";
                            String protitulo1=request.getParameter("ti_nombre");
                            
                           db2.query.executeUpdate("insert into bitacoras "
                                        + "(bi_usuario, bi_nombreusuario, bi_detalle,bi_operacion,bi_fecha)"
                                       + "values('"+ session.getAttribute("ucodigo")+"'"
                                       + ",'"+ session.getAttribute("unombre")+"'"  
                                       + ",'"+ detalle+"'" 
                                       + ",'"+ protitulo1+"'"           
                                       + ", SYSDATE )");
                            
                            db2.commit();
                            db2.desconectar();
                        } catch (Exception e) {
                            out.print(e);
                        }
         //fin bitacora
        
        
        response.sendRedirect("inicio.jsp");
        %>

