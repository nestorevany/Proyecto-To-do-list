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
        String descripcion=request.getParameter("s_descripcion");
        String codigo_proyecto=request.getParameter("p_codigo");
       //String titulopro=request.getParameter("s_codigo");
        
        try{
                dba db = new dba();
                db.Conectar();
                
                db.query.executeUpdate("insert into secciones "
                                        + "(se_descripcion, proy_codigo)"
                                       + "values('"+ descripcion+"'"       
                                       + ",'"+ codigo_proyecto+"')");                                           
                db.desconectar();
                //Thread.sleep(1000);
            }catch(Exception e){
                e.printStackTrace();
            }
        response.sendRedirect("mibandeja.jsp");
        %>

