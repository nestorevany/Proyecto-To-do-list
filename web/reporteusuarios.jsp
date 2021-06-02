<%@page import="java.sql.Statement"%>
<%@page import="java.io.StringReader"%>
<%@page import="com.lowagie.text.html.simpleparser.HTMLWorker"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Date"%>
<%@page import="database.dba"%>
<%@page import="java.sql.ResultSet"%>

<%
    //configurar el header y el tipo
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", 
            "attachment; filename=\"usuarios.pdf\"");
    try {
        //crear y abrir documento tipo pdf
        Document documentoPDF = new Document();
        PdfWriter.getInstance(documentoPDF, response.getOutputStream());
        documentoPDF.open();       

        //algunos parametros
        documentoPDF.addAuthor("Nestor Velasquez");
        documentoPDF.addCreator("nvelasquez");
        documentoPDF.addSubject("miperfil");
        documentoPDF.addCreationDate();
        documentoPDF.addTitle("DAW-PDF");
        
        //colocar imagen
        String URLimage = application.getRealPath("/") + "/" + "todoist.png";
        Image imagen = Image.getInstance(URLimage);
        documentoPDF.add(imagen);

        //agregar parrafos
        documentoPDF.add(new Paragraph(""));
        documentoPDF.add(new Paragraph(new Date().toString()));
        documentoPDF.add(new Paragraph("\n"));
        
        //insertar html
         HTMLWorker htmlWorker = new HTMLWorker(documentoPDF);
      String str = "<html><head></head><body>"+
        "<br>" +
        "<h1>Lista de Usuarios</h1>" +
        "<br>" +
        "<p>Esta lista muestra un reporte de todos " +
        "los usuarios activos en el sistema. " +
         "<br>" +
          "<br>" +
        "</body></html>";      
     
        htmlWorker.parse(new StringReader(str)); 
        
        //agregar una tabla
        PdfPTable table = new PdfPTable(4);        
        table.addCell("Nombre");
        table.addCell("Apellido");
        table.addCell("Correo");
        table.addCell("Ubicacion");
     
        //documentoPDF.close();
         Statement st=null;
         
         
         try {
                        dba db = new dba();

                        db.Conectar();
                        db.query.execute("select usu_nombre, usu_apellido, usu_correo, ubicacion from usuarios ");

                        ResultSet rs = db.query.getResultSet();

                        while (rs.next()) {

                            table.addCell(rs.getString(1));
                            table.addCell(rs.getString(2));
                            table.addCell(rs.getString(3));
                            table.addCell(rs.getString(4));                  
                            
                   }
                            db.desconectar();

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
         documentoPDF.add(table);
        
       //insertar html
         HTMLWorker htmlWorker1 = new HTMLWorker(documentoPDF);
        String str1 = "<html><head></head><body>"+
        "<br>" +
        "<p>Esta informacion es para uso interno " +
        "se prohibe cuaquier copia o reproduccion. " +
        "<br>" +       
         "<br>" +
          "<br>" +
        "</body></html>";      
     
        htmlWorker1.parse(new StringReader(str1));   
         
         
         
        documentoPDF.close();
    } catch (DocumentException de) {
        throw new IOException(de.getMessage());
    }
%>
