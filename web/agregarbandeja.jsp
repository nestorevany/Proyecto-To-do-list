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
        String protitulo=request.getParameter("txtnseccion");
        
        try{
                dba db = new dba();
                db.Conectar();
                
                db.query.executeUpdate("insert into proyecto_secciones "
                                        + "(usus_codigo, proys_titulo)"
                                       + "values('"+ usucodigo+"'"       
                                       + ",'"+ protitulo+"')");
            
                
                out.print("<script>alert('Seccion creado ');</script>");
                //db.commit();
                db.desconectar();
                //Thread.sleep(1000);
            }catch(Exception e){
                e.printStackTrace();
            }
        response.sendRedirect("mibandeja.jsp");
        %>


