<%-- 
    Document   : login
    Created on : May 2, 2020, 4:55:23 PM
    Author     : Nestor
--%>
<%@ page language="java" import="java.util.*, java.sql.*,controlador.sendmail"%>
<jsp:useBean id="send" class="controlador.sendmail" scope="page">
<%@page language="java" import="util.EnviarEmail,java.util.*, java.sql.*"%>    
<jsp:setProperty name="send" property="*"></jsp:setProperty>
</jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String mensagemUsuario=null;

if (request.getMethod().equals("POST")) {
    EnviarEmail enviar = new EnviarEmail();
    enviar.setEmailDestinatario(request.getParameter("txtcorreo"));
    enviar.setAssunto("Recuperar Contrasena");
    //uso StringBuffer para otimizar a concatenação 
    //de string
    StringBuffer texto = new StringBuffer(); 
    texto.append("<h2 align='center'>SOLICITUD DE CAMBIO DE CONTRASENA</h2>");
    texto.append("Correo Electronico: ");
    texto.append(request.getParameter("txtcorreo"));
    texto.append("<br/>");
    texto.append("Ingrese al siguiente enlace para realizar el cambio<br/>");
    
 
    //texto.append("Password: ");
    
    Class.forName("oracle.jdbc.OracleDriver").newInstance();
Connection cona=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
Statement sta=cona.createStatement();
String correoa=request.getParameter("txtcorreo");
String strQuerya = "SELECT usu_contrasena, usu_codigo FROM nestoruser.usuarios where usu_correo='"+correoa+"'";
ResultSet rsa = sta.executeQuery(strQuerya);
String Countrowa = "";
String ucodigo = "";
if (rsa.next()) {
   Countrowa = rsa.getString(1);
   ucodigo = rsa.getString(2);    
}
if(!Countrowa.equals("")){
    //texto.append(Countrowa);   
    texto.append("http://localhost:8080/Edmon/restablecerpass.jsp?codigou="+ucodigo+"");
    
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
response.sendRedirect("login.jsp");
}
%>  



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
	<title>Recuperar Contrasena</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="Login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/plugins/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/plugins/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login/plugins/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/plugins/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/plugins/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login/plugins/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/css/util.css">
	<link rel="stylesheet" type="text/css" href="Login/css/main.css">
<!--===============================================================================================-->
    </head>
    <body>
         	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('Login/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                                     <form class="login100-form validate-form" name="frm1" method="post"> 
                                         
					
                                         <h3>Olvidaste tu Contraseña?</h3>
                                         <br>
					<p>
                                            Para restablece tu contraseña introduce tu direccion de correo electronico
                                        </p>
                                        <br>
					                                        
                                         <div class="wrap-input100 validate-input m-b-23" data-validate = "Correo es requerido">
						<span class="label-input100">Email</span>
						<input class="input100" type="text" name="txtcorreo" placeholder="Ingrese su Email">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
                                                                                
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Recuperar Contraseña
							</button>
						</div>
					</div>

					<div class="flex-col-c p-t-155">
                                            <a href="index.jsp">Regresar a Inicio</a>                                                                            
                                            <span class="label-input100">No tienes cuenta?</span><a href="crearlogin.jsp" class="txt2">Registrate</a>      
						
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
	<script src="Login/plugins/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/plugins/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/plugins/bootstrap/js/popper.js"></script>
	<script src="Login/plugins/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/plugins/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/plugins/daterangepicker/moment.min.js"></script>
	<script src="Login/plugins/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Login/plugins/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="Login/js/main.js"></script>
        
    </body>
</html>

