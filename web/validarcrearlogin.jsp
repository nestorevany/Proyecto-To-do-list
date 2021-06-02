
<%@page language="java" import="util.EnviarEmail,java.util.*, java.sql.*"%>
<%@page import="java.io.*"%>

<%
try
{
ResultSet rs =null;
String mensagemUsuario=null;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
Statement stmt=con.createStatement();
String nombre=request.getParameter("txtnombre");
String apellido=request.getParameter("txtapellido");
String correo=request.getParameter("txtcorreo");
String contrasena=request.getParameter("txtcontrasena");
String ubicacion=request.getParameter("ddl_p");
//int tipo=1;

stmt.executeUpdate("insert into usuarios (usu_nombre,usu_apellido,usu_correo,usu_contrasena,ubicacion) values('"+nombre+"','"+apellido+"','"+correo+"','"+contrasena+"','"+ubicacion+"')");  

   EnviarEmail enviar = new EnviarEmail();
   enviar.setEmailDestinatario(request.getParameter("txtcorreo"));
    enviar.setAssunto("Todo List-Nuevo Usuario");
    //uso StringBuffer para otimizar a concatenação 
    //de string
    StringBuffer texto = new StringBuffer(); 
    texto.append("<h2 align='center'>BIENVENIDO A TODO LIST</h2>");
    texto.append("Su cuenta se ha Creado Exitosamente:<br/>");
    texto.append("Nombre: ");
    texto.append(request.getParameter("txtnombre"));
    texto.append("<br/>");
    texto.append("Apellido: ");
    texto.append(request.getParameter("txtapellido"));
    texto.append("<br/>");
    texto.append("Contrasena: ");
    texto.append(request.getParameter("txtcontrasena"));
    texto.append("<br/>");
    texto.append("<br/>");
    texto.append("Ingrese al siguiente enlace para iniciar sesion");
    texto.append("<br/>");
    texto.append("http://localhost:8080/Proyectotodo/login.jsp");
    
    enviar.setMsg(texto.toString());
    
    boolean enviou = enviar.enviarGmail();    
    if (enviou) {  
            out.print("<script>alert('El usuario fue Creado Exitosamente');</script>");
            mensagemUsuario = "Datos Enviado con Exito";
                      
        } else {
            mensagemUsuario = "No se Envio la Informacion";
            //out.print("<script>alert('el usuario no fue Creado');</script>");
            
        }
    
response.sendRedirect("login.jsp");
con.close();
stmt.close();    
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} %>

   <script>
         alert("Usuario Creado");
         
     </script>