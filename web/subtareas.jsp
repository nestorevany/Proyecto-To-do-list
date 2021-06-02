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
                                     <h3>Nombre de la Tarea: <%= request.getParameter("ta_descripcion") %></h3>
                                    
					<div class="content">
						<div class="module">
							<div class="module-head">
								<h3>Sub-Tareas</h3>
                                                                
							</div>
							<div class="module-body table">
								<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" width="100%">
									<thead>
										<tr>
											<th>Codigo</th>
											<th>Descripcion</th>
											<th>Editar</th>
											<th>Programar</th>
                                                                                        <th>Eliminar</th>
											
										</tr>
									</thead>
									<tbody>
                                                                  
                                                                            <%
                                                                                
        try{
        dba db = new dba();
        db.Conectar(); 
        db.query.execute("select sub_codigo, sub_descripcion ,ta_codigo from sub_tareas where ta_codigo = '"+request.getParameter("ta_codigo")+"'");
        ResultSet rs1 = db.query.getResultSet();     
        while(rs1.next())                                                                      
                                       
        {
            String subcodigo=rs1.getString(1);  
            String subdescripcion=rs1.getString(2); 
            //String ta_codigo=rs1.getString(3); 
           
                       
  %>   
                                                               
										<tr class="odd gradeX">
											<td><%=subcodigo%></td>
											<td><%=subdescripcion%></td>
											
                                                                                          <td>  <a href="subtareas.jsp?sub_codigo=<%=subcodigo%>&sub_nombre=<%=subdescripcion%>&ta_codigo=<%=request.getParameter("ta_codigo")%>&ta_descripcion=<%= request.getParameter("ta_descripcion") %>&p_editarsub=1" class="btn" ><i class="icon-edit"></i>Editar </a></td>
											<td class="center"> 
                                                                                        <input type="date" id="start" name="trip-start"
                                                                                            value="2018-07-22"
                                                                                            min="2018-01-01" max="2018-12-31">
                                                                                    
                                                                                        </td>
											<td>  <a href="eliminarsubtarea.jsp?sub_codigo=<%=subcodigo%>&ta_codigo=<%=request.getParameter("ta_codigo")%>&ta_descripcion=<%= request.getParameter("ta_descripcion") %>">Eliminar</a></td>
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
                                                <a href="subtareas.jsp?ta_codigo=<%=request.getParameter("ta_codigo")%>&ta_descripcion=<%= request.getParameter("ta_descripcion") %>&p_agregarsub=1"><input type="button" value="Añadir Sub Tarea" name="btnagregar" /></a>  

					<br />
						
					</div><!--/.content-->
                                        <br>
<%
//paso #2 si preciono el link para modificar
if( request.getParameter("p_editarsub")!=null  ){
    %>
    
    <hr>
    <h3>Modificar Subtarea</h3>
        <form name="f1" action="editarsubtarea.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>                                         
                      <td>Descripcion</td>
                        <td><input type="text" name="txtsubdescripcion" value="<%= request.getParameter("sub_nombre") %>" /></td>
                         <td><input type="hidden" name="txtsubcodigo" value="<%= request.getParameter("sub_codigo") %>" /></td>  
                    </tr>                   
                    <tr>                        
                       
                        <td><input type="hidden" name="txttacodigo" value="<%= request.getParameter("ta_codigo") %>" /></td>
                        <td><input type="hidden" name="txttadescripcion" value="<%= request.getParameter("ta_descripcion") %>" /></td>
                    </tr>                   
                    <tr>
                        <td> <input type="submit" value="modificar" name="bt_modificar" />   </td>                                           
                        <td> <a href="subtareas.jsp?ta_codigo=<%= request.getParameter("ta_codigo")%>&ta_descripcion=<%= request.getParameter("ta_descripcion") %>"><input type="button" value="Cancelar" name="btncancelar" /></a> </td>                        
                    </tr>
                </tbody>
            </table>
        </form>

<%
}
%>

<%
//paso #2 si preciono el link para modificar
if( request.getParameter("p_agregarsub")!=null  ){
    %>
    
    <hr>
    <h3>Añadir Subtarea</h3>
        <form name="f1" action="agregarsubtarea.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>                                         
                      <td>Descripcion</td>
                        <td><input type="text" name="txtsubdescripcion" value="" /></td>
                         <td><input type="hidden" name="txtsubcodigo" value="<%= request.getParameter("sub_codigo") %>" /></td>  
                    </tr>                   
                    <tr>                        
                       
                        <td><input type="hidden" name="txttacodigo" value="<%= request.getParameter("ta_codigo") %>" /></td>
                        <td><input type="hidden" name="txttadescripcion" value="<%= request.getParameter("ta_descripcion") %>" /></td>
                    </tr>                   
                    <tr>
                        <td> <input type="submit" value="Agregar" name="bt_modificar" />   </td>                                           
                        <td> <a href="subtareas.jsp?ta_codigo=<%= request.getParameter("ta_codigo")%>&ta_descripcion=<%= request.getParameter("ta_descripcion") %>"><input type="button" value="Cancelar" name="btncancelar" /></a> </td>                        
                    </tr>
                </tbody>
            </table>
        </form>

<%
}
%> 
                                        
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
