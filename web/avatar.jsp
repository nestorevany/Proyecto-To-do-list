<%@page import="java.sql.ResultSet"%>
<%@page import="database.dba"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem"%>?


<!DOCTYPE html>
<html lang="en">


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Edmin</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>
<body>

    
    

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

			  	<a class="brand" href="index.html">
			  		Todoist
			  	</a>

				<div class="nav-collapse collapse navbar-inverse-collapse">
					<ul class="nav nav-icons">
						<li class="active"><a href="#">
							<i class="icon-envelope"></i>
						</a></li>
						<li><a href="#">
							<i class="icon-eye-open"></i>
						</a></li>
						<li><a href="#">
							<i class="icon-bar-chart"></i>
						</a></li>
					</ul>

					<form class="navbar-search pull-left input-append" action="#">
						<input type="text" class="span3">
						<button class="btn" type="button">
							<i class="icon-search"></i>
						</button>
					</form>
				
					<ul class="nav pull-right">
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Proyectos Compartidos
                            <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                   <%
           try{
        dba db = new dba();
        db.Conectar(); 
        db.query.execute("select proy_codigo, proy_titulo, usu_codigo,col_procodigo,col_usucodigo from proyectos, colaboradores where proy_codigo= col_procodigo and col_usucodigo= '" + session.getAttribute("ucodigo") + "'");
        ResultSet rs = db.query.getResultSet();        
        
        while(rs.next()){
            String codigo = rs.getString(1);
            String titulo = rs.getString(2);
                                                                           
  %>      
                                                 
                                                   <li><a href="proyectos2.jsp?p_codigo=<%=codigo%>&p_titulo=<%=titulo%>"><%=titulo%></a></li>
                                                   
                                                    <%
                                                }
                                                db.desconectar();
 //Thread.sleep(1000);
                                            }catch(Exception e){
                                            e.printStackTrace();
                                        }
                                            %>   
                                    
                                </ul>
                        </li>
                        <li><a href="#">Support </a></li>
						</a></li>
						 <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                         <%
                                                                                
        try{
           dba db = new dba();
        db.Conectar(); 
                db.query.execute("select anombre,aurl,acodigo from avatar where acodigo= '"+request.getParameter("avatar")+"'");
                ResultSet rs1 = db.query.getResultSet();
                while (rs1.next()){
                String mostrar;
                mostrar = rs1.getString(1);
                       
  %>                                      
                    
                     <img src="<%=mostrar%>" class="nav-avatar" />                    
  		 <%
                                                }
                                                db.desconectar();
                                            //Thread.sleep(1000);
                                            }catch(Exception e){
                                            e.printStackTrace();
                                        }
                                            %>                 

                                <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Hola <%=session.getAttribute("unombre")%></a></li>
                                    <li><a href="miperfil.jsp">Mi Perfil</a></li>
                                    <li><a href="#">Configuracion</a></li>
                                    <li class="divider"></li>
                                    <li><a href="login.jsp">Salir</a></li>
                                </ul>
                            </li>
					</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->



	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="sidebar">

						<ul class="widget widget-menu unstyled">
							<li class="active">
								<a href="index.html">
									<i class="menu-icon icon-dashboard"></i>
									Dashboard
								</a>
							</li>
							<li>
								<a href="miperfil.jsp">
									<i class="menu-icon icon-bullhorn"></i>
									Mi Perfil
								</a>
							</li>
							<li>
								<a href="usuarios.jsp">
									<i class="menu-icon icon-inbox"></i>
									Usuarios
									<b class="label green pull-right"></b>
								</a>
							</li>
							
							<li>
								<a href="task.html">
									<i class="menu-icon icon-tasks"></i>
									Tasks
									<b class="label orange pull-right"></b>
								</a>
							</li>
						</ul><!--/.widget-nav-->

						<ul class="widget widget-menu unstyled">
                                <li><a href="ui-button-icon.html"><i class="menu-icon icon-bold"></i> Buttons </a></li>
                                <li><a href="ui-typography.html"><i class="menu-icon icon-book"></i>Typography </a></li>
                                <li><a href="form.html"><i class="menu-icon icon-paste"></i>Forms </a></li>
                                <li><a href="table.html"><i class="menu-icon icon-table"></i>Tables </a></li>
                                <li><a href="charts.html"><i class="menu-icon icon-bar-chart"></i>Charts </a></li>
                            </ul><!--/.widget-nav-->

						 <ul class="widget widget-menu unstyled">
                                <li><a href="ui-button-icon.html"><i class="menu-icon icon-bold"></i> Etiquetas </a></li>
                                <li><a href="ui-typography.html"><i class="menu-icon icon-book"></i>Filtros </a></li>
                            </ul>
                            <!--/.widget-nav-->
                            <ul class="widget widget-menu unstyled">
                                
                                <li><a href="#"><i class="menu-icon icon-cog"></i>Configuraciones </a></li>
                                <li><a href="login.jsp"><i class="menu-icon icon-signout"></i>Salir </a></li>
                            </ul>
                        </div><!--/.sidebar-->
				</div><!--/.span3-->


				<div class="span9">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>Subir Avatar</h3>
							</div>
     
							<div class="module-body">

									
							</div>
                                                    
       <form name="form1" action="lista_archivos1.jsp" method="POST"
              enctype="MULTIPART/FORM-DATA">

            <%//Insertamos un file Select%>
            Archivo <input type="file" name="archivo" />
            <br>
            <br>
            <%//insertamos un boton para hacer submit%>
            <input type="submit" value="Subir Archivo" name="bt_subir" />
           
        </form>
           
					</div>
            
<div class="content">
						<div class="module">
							<div class="module-head">
								<h3>Lista de Avatar</h3>
                                                                
							</div>
							<div class="module-body table">
								<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" width="100%">
									<thead>
										<tr>
											<th>Imagen</th>
											<th>Accion</th>	
                                                                                        <th>Accion</th>
											
										</tr>
									</thead>
									<tbody>
                                                                  
                                                                            <%
                                                                                
        try{
           dba db = new dba();
        db.Conectar(); 
                db.query.execute("select aurl,acodigo from avatar");
                ResultSet rs1 = db.query.getResultSet();
                while (rs1.next()){
                String mostrar;
                mostrar = rs1.getString(1);
                String acodigo = rs1.getString(2);
                
                //session.setAttribute("acodigo", acodigo);
                       
  %>   
                                                               
										<tr class="odd gradeX">
											<td><%=mostrar%></td>
								
                                                                                        <td>  <a href="miperfil.jsp?eavatar=<%=acodigo%>">Seleccionar</a></td>
                                                                                        <td>  <a href="eliminaravatar.jsp?eavatar=<%=acodigo%>">Eliminar</a></td>
                                                                        
										</tr>
							 <%
                                                }
                                                db.desconectar();
                                            Thread.sleep(1000);
                                            }catch(Exception e){
                                            e.printStackTrace();
                                        }
                                            %>
									</tbody>
									
								</table>
                                                                      
							</div>
						</div><!--/.module-->                              

					<br />
						
					</div><!--/.content-->
                                        <br>
                                  
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

	<div class="footer">
		<div class="container">
			 

			<b class="copyright">&copy; 2014 Edmin - EGrappler.com </b> All rights reserved.
		</div>
	</div>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
</body>