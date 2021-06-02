<%-- 
    Document   : login
    Created on : May 2, 2020, 4:55:23 PM
    Author     : Nestor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
	<title>Registrarse</title>
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
            var sinCifrar =document.getElementById('txtcontrasena').value;           
            document.getElementById('txtcontrasena').value=hex_md5(sinCifrar);                    
            f1.submit();            
        }
    </script>



    </head>
    <body>
         	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('Login/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                                     <form class="login100-form validate-form" name="frm1" action="validarcrearlogin.jsp">   
					<span class="login100-form-title p-b-49">
						Registrarse
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Nombre es requerido">
						<span class="label-input100">Nombre</span>
						<input class="input100" type="text" name="txtnombre" placeholder="Ingrese su Nombre">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
                                         
                                         <div class="wrap-input100 validate-input m-b-23" data-validate = "Apellido es requerido">
						<span class="label-input100">Apellido</span>
						<input class="input100" type="text" name="txtapellido" placeholder="Ingrese su Apellido">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
                                         
                                         <div class="wrap-input100 validate-input m-b-23" data-validate = "Correo es requerido">
						<span class="label-input100">Email</span>
						<input class="input100" type="text" name="txtcorreo" placeholder="Ingrese su Email">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>


					<div class="wrap-input100 validate-input" data-validate="Contrasena es requerido">
						<span class="label-input100">Contraseña</span>
						<input class="input100" id="txtcontrasena" type="password" name="txtcontrasena" placeholder="Ingrese su contraseña">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>    
                                         
                                        <br> 
                                        <span class="label-input100">Ubicacion</span>
                                        <select name="ddl_p">
                                         <option>14.0818, -87.20681</option>
                                        <option>15.50417, -88.025</option>
                                        </select>
                                        <span class="focus-input100" data-symbol="&#xf206;"></span>
                                        <br> 
                                        <br> 
                                        <div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
                                                        <input type="hidden" name="bt_buscar" id="bt_buscar" value="Buscar" onclick="modificarPASS(1);"/>  
							<button class="login100-form-btn" name="bt_agregar" id="bt_agregar" onclick="modificarPASS(2);">
								Registrarse
							</button>
                                                        
                                                         <input type="hidden" name="hd_accion"  id="hd_accion" value="">
                               
						</div>
					</div>
                                        
                                        
					<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							O Ingresar con
						</span>
					</div>

					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>
						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>
					<div class="flex-col-c p-t-155">
                                            <a href="index.jsp">Regresar a Inicio</a>                                                                                
						
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

