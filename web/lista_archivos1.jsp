<%@page import="java.sql.ResultSet"%>
<%@page import="database.dba"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%//creamos el codigo para guardar en disco%>
        <%
            String dir = "";
            //clase para subir archivos a disco
            //DiskFileUpload fu = new DiskFileUpload(); //hasta versión 6 de apache
            ServletFileUpload fu = new ServletFileUpload(new DiskFileItemFactory()); //apache 7 

            //parceamos lo que viene en el request y lo clasificamos en ítems antes de apache 8.14
            //List items = fu.parseRequest(request);
            List items = fu.parseRequest(new ServletRequestContext(request)); //apache 814 en adelante

            // Iteramos por cada elemento del Request
            Iterator i = items.iterator();

            String fileName = "";
            String link = "";
            File fichero = null;
            while (i.hasNext()) {
                FileItem ff = (FileItem) i.next();
                //verificamos si el elemento es un archivo
                if (!ff.isFormField()) {
                    long a = ff.getSize();
                    //verificamos si el tamano del archivo es mayor a 0 bites
                    if (a > 0) {
                        fileName = ff.getName();
                        fichero = new File(fileName);
                        // escribimos el fichero en la carpeta que corresponde
                        fichero = new File(application.getRealPath(""), fichero.getName());
                        ff.write(fichero);
                    }
                } else {
                    if (ff.getFieldName().compareTo("ti_nombre") == 0) {
                        link = ff.getString();
                    }
                }
            }
            //ejemplo parte 1
            //escribimos la lista de hipervinculos en archivos para log

            try {
                dba db = new dba();
        db.Conectar(); 
                db.query.execute("insert into avatar (aurl,anombre) values('" +"<img src=\"" + application.getContextPath() + "/" + fichero.getName() + "\">" + link + "</>" + "','" + application.getContextPath() + "/" + fichero.getName() +"')");
                ResultSet rs1 = db.query.getResultSet();
                db.desconectar();
            } catch (Exception e) {
                out.print("Conexion Exitosa");
                out.println(e);
                e.printStackTrace();
            }

            
               dba db = new dba();
        db.Conectar(); 
                db.query.execute("select aurl from avatar");
                ResultSet rs1 = db.query.getResultSet();
                while (rs1.next()){
                String mostrar;
                mostrar = rs1.getString(1);
                
        %>

    
      <%=mostrar%><br>
       
      

    <%
        } 
            db.desconectar();
            
            
        


    %> 

    <a href="avatar.jsp">Ver mis Avatar</a>



</body>
</html>

