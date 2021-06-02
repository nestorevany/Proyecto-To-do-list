<%@page import="java.io.StringReader"%>
<%@page import="com.lowagie.text.html.simpleparser.HTMLWorker"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Date"%>

<%
    //configurar el header y el tipo
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", 
            "attachment; filename=\"reporte.pdf\"");
    try {
        //crear y abrir documento tipo pdf
        Document documentoPDF = new Document();
        PdfWriter.getInstance(documentoPDF, response.getOutputStream());
        documentoPDF.open();       

        //algunos parametros
        documentoPDF.addAuthor("Osman Mejia");
        documentoPDF.addCreator("Omejia");
        documentoPDF.addSubject("Documento de prueba");
        documentoPDF.addCreationDate();
        documentoPDF.addTitle("DAW-PDF");

        //agregar parrafos
        documentoPDF.add(new Paragraph("Documento de Pruebas"));
        documentoPDF.add(new Paragraph(new Date().toString()));
        documentoPDF.add(new Paragraph("\n"));
        

        //agregar una tabla
        PdfPTable table = new PdfPTable(3);        
        table.addCell("nombre");
        table.addCell("edad");
        table.addCell("direccion");
        table.addCell("Juan Perez");
        table.addCell("25");
        table.addCell("Col. Kennedy");
        documentoPDF.add(table);
        //documentoPDF.close();
                
        //colocar imagen
        String URLimage = application.getRealPath("/") + "/" + "Husky.jpg";
        Image imagen = Image.getInstance(URLimage);
        documentoPDF.add(imagen);
        //documentoPDF.close();
        
        //insertar html
        HTMLWorker htmlWorker = new HTMLWorker(documentoPDF);
      String str = "<html><head></head><body>"+
        "<br>" +
        "<h1>Muestra como convertir html a pdf</h1>" +
        "<a href='http://www.unitec.edu'><b>ir a Pagina de Unitec</b></a>" + 
        "<br>" +
        "<p>Cuando crees en Dios, no importa qué religión perteneces," +
        "posees poderes inexplicables para hacer todo lo mejor y cuidar de nosotros." +
        "A veces, su trabajo es silencioso y no puede ser visto fácilmente, sino que está "+ 
        "observando cada uno de nosotros, manteniéndonos sanos y capaces de "+ 
        "distinguir entre el bien y el mal. " +
        "<P><br><table border='1'><tr><td>Tabla de HTML<tr>" +
        "<td bgcolor='red'>fila2<tr><td>fila3</table>" +
        "</body></html>";      
     
        htmlWorker.parse(new StringReader(str)); 

        // cerrar el documento
        documentoPDF.close();
    } catch (DocumentException de) {
        throw new IOException(de.getMessage());
    }
%>

