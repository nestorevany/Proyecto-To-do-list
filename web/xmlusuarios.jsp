
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.dba"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.jdom.output.Format"%>
<%@page import="org.jdom.output.XMLOutputter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="org.jdom.Element"%>
<%@page import="org.jdom.Document"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>.: XML Usuarios :.</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="add/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="add/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="add/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>

    <%//exportar todo a xml

            Document doc = new Document();
            Element raiz = new Element("Usuario");
            doc.setRootElement(raiz);

            try {
               dba db = new dba();
                        db.Conectar();db.query.execute("select * from usuarios");
                ResultSet rs = db.query.getResultSet();
                ResultSetMetaData rsmd = rs.getMetaData();

                int numcols = rsmd.getColumnCount();
                while (rs.next()) {
                    List elmts = new ArrayList();
                    for (int i = 1; i <= numcols; i++) {
                        String colname = rsmd.getColumnName(i);
                        String colval = rs.getString(i);
                        Element elmt = new Element(colname);
                        elmt.setText(colval);
                        elmts.add(elmt);
                    }
                    Element row = new Element("Usuario");
                    row.setContent(elmts);
                    raiz.addContent(row);
                }

                rs.close();

                XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat());
                try {
                    File fichero = new File(application.getRealPath("Usuarios.xml"));
                    FileOutputStream fos = new FileOutputStream(fichero.getPath());
                    outputter.output(doc, fos);
                    fos.close();
                    out.print("<script>alert('El archivo XML se genero exitosamente');</script>");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
 response.sendRedirect("inicio.jsp");           
    %>
    
    </br></br></br></br></br>
    
    
</html>
