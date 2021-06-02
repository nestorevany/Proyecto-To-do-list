<%-- 
    Document   : login
    Created on : May 2, 2020, 4:55:23 PM
    Author     : Nestor
--%>
<%@ page language="java" import="java.util.*, java.sql.*,controlador.sendmail"%>
<jsp:useBean id="send" class="controlador.sendmail" scope="page">
<%@page language="java" import="util.EnviarEmail,java.util.*, java.sql.*"%>   
<%@page import="database.*"%>
<jsp:setProperty name="send" property="*"></jsp:setProperty>
</jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

<script src="encriptar/md5.js" type="text/javascript"></script>
 <script>
        function modificarPASS(accion){
            if(accion==1){
                document.getElementById('hd_accion').value=1;
            }
            else{
                document.getElementById('hd_accion').value=2;
            }
            var sinCifrar =document.getElementById('txtcontrasena1').value;           
            document.getElementById('txtcontrasena1').value=hex_md5(sinCifrar);                    
            f1.submit();            
        }
    </script>


    </head>
    <body>
   <%
 //MODIFICAR un producto  
try
{ 
if (request.getMethod().equals("POST")) {
        String codigo=request.getParameter("txtcodigo");  
        String nombre=request.getParameter("txtnombre");
        String apellido=request.getParameter("txtapellido");
        String correo=request.getParameter("txtcorreo"); 
        String contrasena=request.getParameter("txtcontrasena1"); 
        String tipo=request.getParameter("txttipo"); 
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs; 
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
        pst=con.prepareStatement("update usuarios set usu_nombre = ?, usu_apellido=?, usu_correo=?, usu_contrasena=?, ubicacion=? where usu_codigo = ?");
        pst.setString(1, nombre);
        pst.setString(2, apellido);
        pst.setString(3, correo);
        pst.setString(4, contrasena);
        pst.setString(5, tipo);
        pst.setString(6, codigo);
        pst.executeUpdate();              

     %>

     <script>
         alert("Registro Actualizado");
         
     </script>
<%
    con.close(); 
    response.sendRedirect("login.jsp");
    }
}

catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} %>     
        
        

         	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('Login/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                                     <form class="login100-form validate-form" name="frm1" action="restablecerpass.jsp" method="post"> 
                                         
					
                                         <h3>Olvidaste tu Contraseña?</h3>
                                         <br>
					<p>
                                            Ingresa tu nueva contrasena
                                        </p>
                                        <br>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Nombre es requerido">
						<span class="label-input100">Nueva Contrasena</span>
						<input class="input100" type="password" name="txtnombre1" placeholder="Ingresar contrasena">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
                                         
                                         <div class="wrap-input100 validate-input m-b-23" data-validate = "Correo es requerido">
						<span class="label-input100">Confirmar Contrasena</span>
						<input class="input100" id="txtcontrasena1" type="password" name="txtcontrasena1" placeholder="Confirmar contrasena">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
 <%
       
         try{
        dba db = new dba();
        db.Conectar(); 
        db.query.execute("select usu_codigo,usu_nombre,usu_apellido,usu_correo,usu_contrasena,ubicacion from usuarios where usu_codigo='"+request.getParameter("codigou")+"'");
        ResultSet rs = db.query.getResultSet();     
        while(rs.next())
        {
           
            String nombre=rs.getString(2); 
            String apellido=rs.getString(3); 
            String correo=rs.getString(4); 
            String contrasena=rs.getString(5);             
            String tipocodigo=rs.getString(6); 
           
             String codigo=rs.getString(1);  
                       
  %>  
            <table border="0">
                <tbody>
                    <tr>                                         
                       
                        <td><input type="hidden" name="txtnombre" value="<%= nombre%>" /></td>                       
                        
                        <td><input type="hidden" name="txtapellido" value="<%= apellido%>" /></td>
                    </tr>
                    <tr>                        
                      
                        <td><input type="hidden" name="txtcorreo" value="<%= correo%>" /></td>
                                              
                        <td><input type="hidden" name="txtcontrasena" value="" /></td>
                    </tr>
                    <tr>                        
                        
                        <td><input type="hidden" name="txttipo" value="<%= tipocodigo %>" /></td>
                        <td><input type="hidden" name="txtcodigo" value="<%= codigo %>" /></td>
                    </tr>                   
                </tbody>
            </table>
  <%  }
                            db.desconectar();
                        }catch(Exception e){
                        e.printStackTrace();
                    }
 %>                                                        
                                          

                                        
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" name="bt_buscar" id="bt_buscar" onclick="modificarPASS(1);">
								Restablecer password 
							</button>  
                                                         <input type="hidden" name="bt_agregar" id="bt_agregar" value="Agregar" onclick="modificarPASS(2);"/>       
                                                         <input type="hidden" name="hd_accion"  id="hd_accion" value="">
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

