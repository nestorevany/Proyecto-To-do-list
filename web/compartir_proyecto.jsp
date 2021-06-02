<%@page language="java" import="util.EnviarEmail,java.util.*, java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

<%
String mensagemUsuario=null;
    EnviarEmail enviar = new EnviarEmail();
    enviar.setEmailDestinatario(request.getParameter("txtemail"));
    enviar.setAssunto("Proyecto Compartido");
    //uso StringBuffer para otimizar a concatenação 
    //de string
    StringBuffer texto = new StringBuffer(); 
    texto.append("<h2 align='center'>PROYECTO COMPARTIDO</h2>");
    texto.append("Correo Electronico: ");
    texto.append(request.getParameter("txtemail"));
    texto.append("<br/>");
    texto.append("Todoist le ha compartido el siguente proyecto<br/>");
    texto.append(request.getParameter("txttitulop"));
    
    //texto.append("Password: ");
    
    Class.forName("oracle.jdbc.OracleDriver").newInstance();
Connection cona=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
Statement sta=cona.createStatement();

String correoa=request.getParameter("txtemail");
//String descripcion=request.getParameter("txtnseccion");
String codigo_proyecto=request.getParameter("txtcodigop");
//String codigo_usuario=request.getParameter("txtcodigou");
String titulopro=request.getParameter("txttitulop");


String strQuerya = "SELECT usu_codigo FROM nestoruser.usuarios where usu_correo='"+correoa+"'";
ResultSet rsa = sta.executeQuery(strQuerya);
String ucodigo = "";
if (rsa.next()) {
   ucodigo = rsa.getString(1);
}
if(!ucodigo.equals("")){
    //texto.append(Countrowa);   
    sta.executeUpdate("insert into colaboradores (col_usucodigo, col_procodigo) values('"+ucodigo+"','"+codigo_proyecto+"')");  
   
    enviar.setMsg(texto.toString());      
    boolean enviou = enviar.enviarGmail();    
    if (enviou) {
            
            out.print("<script>alert('Ingrese su nueva contrasena');</script>");
            mensagemUsuario = "Datos enviados con Exito";
           
        } else {
            mensagemUsuario = "No se envio la informacion";
            
        }
}  

else{
out.println("Correo Electronico Incorrecto !");
}

//insertar en Bitacora
        try {
                            dba db2 = new dba();
                            db2.Conectar();
                            String detalle = "Compartir Proyecto";
                            String titulopro1=request.getParameter("txttitulop");
                            
                           db2.query.executeUpdate("insert into bitacoras "
                                        + "(bi_usuario, bi_nombreusuario, bi_detalle,bi_operacion,bi_fecha)"
                                       + "values('"+ session.getAttribute("ucodigo")+"'"
                                       + ",'"+ session.getAttribute("unombre")+"'"  
                                       + ",'"+ detalle+"'" 
                                       + ",'"+ titulopro1+"'"           
                                       + ", SYSDATE )");
                            
                            db2.commit();
                            db2.desconectar();
                        } catch (Exception e) {
                            out.print(e);
                        }
         //fin bitacora


    cona.close();
    //Thread.sleep(1000);
response.sendRedirect("proyectos.jsp?p_codigo="+codigo_proyecto+"&p_titulo="+titulopro+"");

%>  