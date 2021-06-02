<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

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
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
            rel='stylesheet'>
        
        <link type="text/css" href="css/modal.css" rel="stylesheet">

</head>



    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                        <i class="icon-reorder shaded"></i></a><a class="brand" href="inicio.jsp">Todoist </a>
                    <div class="nav-collapse collapse navbar-inverse-collapse">
                        <ul class="nav nav-icons">
                            <li class="active"><a href="#"><i class="icon-envelope"></i></a></li>
                            <li><a href="#"><i class="icon-eye-open"></i></a></li>
                            <li><a href="#"><i class="icon-bar-chart"></i></a></li>
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
                                                 
                                                   <li><a href="proyectos.jsp?p_codigo=<%=codigo%>&p_titulo=<%=titulo%>"><%=titulo%></a></li>
                                                   
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
                        <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                         <%
                                                                                
        try{
           dba db = new dba();
        db.Conectar(); 
                db.query.execute("select anombre,aurl,acodigo from avatar where acodigo= '"+session.getAttribute("acodigo")+"'");
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
                                    <li><a href="#">Mi Perfil</a></li>
                                    <li><a href="#">Configuracion</a></li>
                                    <li class="divider"></li>
                                    <li><a href="login.jsp">Salir</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /.nav-collapse -->
                </div>
            </div>
            <!-- /navbar-inner -->
            
            
        </div>
        <!-- /navbar -->
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="span3">
                        <div class="sidebar">
                             <ul class="widget widget-menu unstyled">
                                <li class="active"><a href="inicio.jsp"><i class="menu-icon icon-dashboard"></i>Dashboard
                                </a></li>
                                
                                 <li><a href="mibandeja.jsp"><i class="menu-icon icon-bullhorn"></i>Bandeja de Entrada </a>
                                </li>                                
                                <li><a href="hoy.jsp"><i class="menu-icon icon-tasks"></i>Hoy<b class="label orange pull-right">
                                    19</b> </a></li>
                                <li><a href="proximo.jsp"><i class="menu-icon icon-inbox"></i>Proximo <b class="label green pull-right">
                                    11</b> </a></li>   
                                
                                <li><a class="collapsed" data-toggle="collapse" href="#togglePages"><i class="menu-icon icon-cog">
                                </i><i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right">
                                </i>Proyectos </a>
                                    <ul id="togglePages" class="collapse unstyled">
                            
                                        <li>
                                            <table border="0">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                 
                                                     <%
           try{
        dba db = new dba();
        db.Conectar(); 
        db.query.execute("select proy_codigo, proy_titulo, usu_codigo from proyectos where  usu_codigo= '" + session.getAttribute("ucodigo") + "' ");
        ResultSet rs = db.query.getResultSet();        
        
        while(rs.next()){
            String codigo = rs.getString(1);
            String titulo = rs.getString(2);
                                                                           
  %>      
                                                 
                                                    <tr>                                                       
                                                        
                                                      <td><a href="proyectos.jsp?p_codigo=<%=codigo%>&p_titulo=<%=titulo%>"><i class="icon-inbox"></i><%=titulo%> </a></td>                                                    
                                                
                                                    </tr>
                                                    <%
                                                }
                                                db.desconectar();
 //Thread.sleep(1000);
                                            }catch(Exception e){
                                            e.printStackTrace();
                                        }
                                            %>
                                                </tbody>
                                            </table>                                          
                                                                                                               
                                                                                            
                                                <!-- Modal content -->
                                                
<div id="myModal" class="modal" style="margin: 0 auto;">  
  <div class="modal-content">
    <span class="close">&times;</span>
    <p> <form name="fM1" action="agregarproyecto.jsp" method="POST">
        
        <table border="1" style="margin: 0 auto;">
            <tr>
                <td><center><h4>Nuevo Proyecto</h4></center></td>
            </tr>
            <tr>
                <td>
                    <table border="0">
                                <tbody>
                                    
                                        <tr><td>Nombre del Proyecto </td></tr>
                                        <tr><td> <input type="text" name="ti_nombre" value="" /> </td></tr> 
                                        
                                </tbody>
                            </table>         
               <input type="hidden" name="txtcodigousuario" value="<%=session.getAttribute("ucodigo")%>" />
               <input type="submit" value="Añadir" name="bt_crear" />
               
              </td>
            </tr>
        </table>
       </form>    
  </div>
</div>
<button id="myBtn">Añadir Proyecto</button> 
<div id="myModal" class="modal"></div>

                                        </li>
                                        
                                    </ul>
                                </li>
                               
                            </ul>
                            <!--/.widget-nav-->
                            
                            
                            <ul class="widget widget-menu unstyled">
                                <li><a href="ui-button-icon.html"><i class="menu-icon icon-bold"></i> Etiquetas </a></li>
                                <li><a href="ui-typography.html"><i class="menu-icon icon-book"></i>Filtros </a></li>
                            </ul>
                            <!--/.widget-nav-->
                            <ul class="widget widget-menu unstyled">
                                
                                <li><a href="#"><i class="menu-icon icon-cog"></i>Configuraciones </a></li>
                                <li><a href="login.jsp"><i class="menu-icon icon-signout"></i>Logout </a></li>
                            </ul>
                        </div>
                        <!--/.sidebar-->
                    </div>

                                                <!--/.span3-->


				<div class="span9">
                                    
                                    
					<div class="content">
						<div class="module">
							<div class="module-head">
								<h3>Bitacora de Actividades</h3>
                                                                
							</div>
							<div class="module-body table">
								<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" width="100%">
									<thead>
										<tr>
											<th>Codigo</th>
											<th>Nombre</th>
											<th>Operacion</th>
                                                                                        <th>Detalle</th>
											<th>Fecha</th>
                                                                                      
											
										</tr>
									</thead>
									<tbody>
                                                                  
                                                                               <%
           try{
        dba db = new dba();
        db.Conectar(); 
        db.query.execute("select bi_usuario, bi_nombreusuario, bi_detalle,bi_operacion, bi_fecha  from bitacoras where  bi_usuario= '" + session.getAttribute("ucodigo") + "' ");
        ResultSet rs = db.query.getResultSet();        
        
        while(rs.next()){
            String bicodigo = rs.getString(1);
            String binombre = rs.getString(2);
            String bioperacion = rs.getString(3);
            String bidetalle = rs.getString(4);
            String bifecha = rs.getString(5);
                                                                           
  %>      
                                                               
										<tr class="odd gradeX">
											<td><%=bicodigo%></td>
											<td><%=binombre%></td>
                                                                                        <td><%=bioperacion%></td>
                                                                                        <td><%=bidetalle%></td>
                                                                                        <td><%=bifecha%></td>
                                                                                       
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

                                        
				</div><!--/.span9-->
                               
                                
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

	<div class="footer">
		<div class="container">
			 

			<b class="copyright">&copy; Nestor Velasquez </b> All rights reserved.
		</div>
	</div>

	<script src="scripts/jquery-1.9.1.min.js"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>

