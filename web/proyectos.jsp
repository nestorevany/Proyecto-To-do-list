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
               <input type="submit" value="A�adir" name="bt_crear" />
               
              </td>
            </tr>
        </table>
       </form>    
  </div>
</div>
<button id="myBtn">A�adir Proyecto</button> 
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
                     
            </div>
                    
        <div class="span9">  <!--/.COMIENZO LAYOUT PRINCIPAL-->
			<div class="content">  <!--/.COMIENZO SECCION-->

						<div class="module message"> <!--/.COMIENZO TAREAS-->
                                                    <form name="frmeditarproyectos" action="editarproyectos.jsp" method="POST">
							<div class="module-head">
                                                        <h3>    
                                                         <%= request.getParameter("p_titulo") %>   
                                               <%
                                                //paso #2 si preciono el link para modificar
                                                if( request.getParameter("btnproyectos")!=null  ){
                                                    %>  
                                                    <input type="hidden" name="txtcodigop" value="<%=request.getParameter("p_codigo")%>" />
                                                    <input type="text" name="txttitulop" value="<%=request.getParameter("p_titulo")%>" />            
                                                    <input type="hidden" name="txtcodigou" value="<%=session.getAttribute("ucodigo")%>" />           
                                                   <input type="submit" value="Actualizar" name="bt_agregar" />
                                                    <a href="proyectos.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>">Cancelar</a>
 
                                                            <% } %> 
   
                                                            </h3>
							</div>
                                                </form>  
                                                <form name="frmcompartir" action="compartir_proyecto.jsp" method="POST">
                                                  <%
                                                //paso #2 si preciono el link para modificar
                                                if( request.getParameter("comproyecto")!=null  ){
                                                    %>  
                                                    <input type="hidden" name="txtcodigop" value="<%=request.getParameter("p_codigo")%>" />
                                                    <input type="hidden" name="txttitulop" value="<%=request.getParameter("p_titulo")%>" />  
                                                    <input type="text" name="txtemail" value="" placeholder ="Email Colaborador" />            
                                                    <input type="hidden" name="txtcodigou" value="<%=session.getAttribute("ucodigo")%>" />           
                                                   <input type="submit" value="Invitar" name="bt_invitar" />
                                                    <a href="proyectos.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>">Cancelar</a>
 
                                                            <% } %>  
                                                              
                                                </form>            
                                                         
							<div class="module-option clearfix">
								<div class="pull-right">
									Opciones : &nbsp;
									<div class="btn-group">
										<button class="btn">All</button>
										<button class="btn dropdown-toggle" data-toggle="dropdown">
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="proyectos.jsp?p_codigo=<%= request.getParameter("p_codigo")%>&p_titulo=<%= request.getParameter("p_titulo") %>&btnproyectos=1">Editar Proyecto</a></li>
											<li><a href="proyectos.jsp?p_codigo=<%= request.getParameter("p_codigo")%>&p_titulo=<%= request.getParameter("p_titulo") %>&comproyecto=1">Compartir Proyecto</a></li>
											<li><a href="eliminarproyecto.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>">Eliminar Proyecto</a></li>
											
											
											
										</ul>
									</div>
								</div>
								<div class="pull-left">
                                                                       
									<a href="proyectos.jsp?p_codigo=<%= request.getParameter("p_codigo")%>&p_titulo=<%= request.getParameter("p_titulo") %>&btnseccion=1" class="btn btn-primary">A�adir Seccion</a>
								</div>
							</div>
							<div class="module-body table">								
                                                                <form name="fM1" action="agregarseccion.jsp?p_codigo=<%=request.getParameter("p_codigo")%>" method="POST">
                                                                    
								<table class="table table-message">
									<tbody>
										<tr class="heading">
											<td class="cell-icon"></td>
											<td class="cell-title">Nombre de la Seccion</td>
											<td class="cell-status hidden-phone hidden-tablet">Editar</td>
                                                                                        <td class="cell-time align-right">Tareas</td>
											
                                                                                        <td class="cell-time align-right">Eliminar</td>
										</tr>
                                                                        
 <%
           try{
        dba db = new dba();
        db.Conectar(); 
        db.query.execute("select se_codigo, se_descripcion, proy_codigo from secciones where proy_codigo='"+request.getParameter("p_codigo")+"'");
        ResultSet rs = db.query.getResultSet();
        while(rs.next()){
            String codigose = rs.getString(1);
            String descripcionse = rs.getString(2);
            String proycodigo = rs.getString(3);                                                                 
  %>       
										<tr class="task">
											<td class="cell-icon"><i class="icon-checker high"></i></td>
											<td class="cell-title"><div><%=descripcionse%></div></td>                                                                                      
											<td class="cell-status hidden-phone hidden-tablet"><a href="proyectos.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>&s_codigo=<%=codigose%>&s_descripcion=<%=descripcionse%>&sp_codigo=<%=proycodigo%>&btn_editar=1"><b class="due">Editar</b></a></td>                                                                                        
                                                                                        <td class="cell-time align-right"><a href="proyectos.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>&se_codigo=<%=codigose%>&s_descripcion=<%=descripcionse%>&btn_tareas=1">Ver</a></td>
                                                                                       
                                                                                        <td class="cell-time align-right"><a href="eliminarseccion.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>&se_codigo=<%=codigose%>">Eliminar</a><i class="icon-remove"></i></td>
										</tr>																														
                                     <%
                                                }
                                                db.desconectar();
 //Thread.sleep(1000);
                                            }catch(Exception e){
                                            e.printStackTrace();
                                        }
                                            %>   
                                                                                  
<%
//paso #2 si preciono el link para modificar
if( request.getParameter("btnseccion")!=null  ){
    %>           

<tr class="task">
<td class="cell-icon"><i class="icon-checker high"></i></td>
<td class="cell-title"><input type="text" name="txtnseccion" value="" /><div></div></td>
<td class="cell-title"><input type="hidden" name="txtptitulo" value="<%=request.getParameter("p_titulo")%>" /><div></div></td>
<td class="cell-title"><input type="submit" value="Agregar" name="bt_agregar" /></td> 
<td class="cell-title"><a href="proyectos.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>">Cancelar</a><div></div></td> 
</tr>
<% } %>                                                                       
                                                                        </tbody>
                                                                        
								</table>  
</form>
							</div>
							<div class="module-foot">

 <%
//paso #2 si preciono el link para modificar
if( request.getParameter("btn_editar")!=null  ){
    %>                                                              
<form name="frmeditarseccion" action="editarseccion.jsp">                                                                                                                         
<input type="hidden" name="txtscodigo" value="<%= request.getParameter("s_codigo") %>" />
<input type="text" name="txtsnombre" value="<%= request.getParameter("s_descripcion") %>" />
<input type="hidden" name="txtpcodigo" value="<%= request.getParameter("sp_codigo") %>" />
<input type="hidden" name="txtptitulo" value="<%=request.getParameter("p_titulo")%>" />
<input type="submit" value="Editar" name="bt_agregar" />   
<a href="proyectos.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>">Cancelar</a><div></div> 
  </form>      
<% } %>                                                            
 

                                                            
							</div>                          
                        
                        <!--/.content-->
                    </div> <!--/.FIN TAREAS-->
                    
                    
                    
 
                    
 
                    
                    
                    
  
<div class="module message"> <!--/.COMIENZO TAREAS TABLA ABAJO-->
							<div class="module-head">
								<h3><%= request.getParameter("s_descripcion") %></h3>
							</div>
							<div class="module-option clearfix">
								
								<div class="pull-left">
									<a href="proyectos.jsp?p_codigo=<%= request.getParameter("p_codigo")%>&p_titulo=<%= request.getParameter("p_titulo")%>&se_codigo=<%=request.getParameter("se_codigo")%>&s_descripcion=<%= request.getParameter("s_descripcion") %>&btntareas=1" class="btn btn-primary">A�adir Tarea</a>
                                                                        
								</div>
							</div>
							<div class="module-body table">								
                                                  <form name="fM1" action="agregartarea.jsp?se_codigo=<%=request.getParameter("se_codigo")%>&p_codigo=<%=request.getParameter("p_codigo")%>" method="POST">
								<table class="table table-message">
									<tbody>
										<tr class="heading">
											<td class="cell-icon"></td>
											<td class="cell-title">Nombre de la Tarea</td>
											<td class="cell-status hidden-phone hidden-tablet">Editar</td>
                                                                                        <td class="cell-time align-right">Sub Tareas</td>
											<td class="cell-time align-right">Programar</td>
                                                                                        <td class="cell-time align-right">Eliminar</td>
                                                                                        <td class="cell-time align-right">Comentarios</td>
										</tr>
                                                                        
 <%
           try{
        dba db = new dba();
        db.Conectar(); 
        db.query.execute("select ta_codigo, ta_descripcion, se_codigo from tareas where se_codigo='"+request.getParameter("se_codigo")+"'");
        ResultSet rs = db.query.getResultSet();
        while(rs.next()){
            String codigota = rs.getString(1);
            String descripcionta = rs.getString(2);
                                                                              
  %>       
										<tr class="task">
											<td class="cell-icon"><i class="icon-checker high"></i></td>
											<td class="cell-title"><div><%=descripcionta%></div></td>  
                                                                                                                                           
											<td class="cell-status hidden-phone hidden-tablet"><a href="proyectos.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>&se_codigo=<%=request.getParameter("se_codigo")%>&s_descripcion=<%= request.getParameter("s_descripcion") %>&ta_codigo=<%=codigota%>&ta_descripcion=<%=descripcionta%>&btn_editart=1"><b class="due">Editar</b></a></td>   
                                                                                     
                                                                                        <td class="cell-time align-right"><a href="subtareas.jsp?ta_codigo=<%=codigota%>&ta_descripcion=<%=descripcionta%>">Ver</a></td>
                                                                                        <td class="cell-time align-right">
                                                                                            <input type="date" id="start" name="trip-start"
                                                                                            value="2018-07-22"
                                                                                            min="2018-01-01" max="2018-12-31">
                                                                                         
                                                                                        </td>
                                                                                        <td class="cell-time align-right"><a href="eliminartarea.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>&se_codigo=<%=request.getParameter("se_codigo")%>&s_descripcion=<%= request.getParameter("s_descripcion") %>&ta_codigo=<%=codigota%>">Eliminar</a></td>
                                                                                        <td class="cell-time align-right"><a href="comentarios.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>&se_codigo=<%=request.getParameter("se_codigo")%>&s_descripcion=<%= request.getParameter("s_descripcion") %>&ta_codigo=<%=codigota%>&ta_descripcion=<%=descripcionta%>">A�adir/Ver</a></td>
                                                                                        
										</tr>																														
                                     <%
                                                }
                                                db.desconectar();
 //Thread.sleep(1000);
                                            }catch(Exception e){
                                            e.printStackTrace();
                                        }
                                            %>
                                            
                                            
<%
//boton de tareas para agregar
if( request.getParameter("btntareas")!=null  ){
    %>           
<tr class="task">
<td class="cell-icon"><i class="icon-checker high"></i></td>
<td class="cell-title"><input type="text" name="txttdescripcion" value="" /><div></div></td>
<td class="cell-title"><input type="hidden" name="txtptitulo" value="<%=request.getParameter("p_titulo")%>" /><div></div></td>
<td class="cell-title"><input type="hidden" name="txtsdescripcion" value="<%=request.getParameter("s_descripcion")%>" /><div></div></td>
<td class="cell-title"><input type="submit" value="Agregar" name="bt_tagregar" /></td> 
<td class="cell-title"><a href="proyectos.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>&se_codigo=<%=request.getParameter("se_codigo")%>&s_descripcion=<%= request.getParameter("s_descripcion") %>">Cancelar</a><div></div></td> 
</tr>
<% } %>       									                                                       
                                                                        
                                                                        </tbody>
								</table> 
</form>
							<div class="module-foot">
 <%
//paso #2 si preciono el link para modificar
if( request.getParameter("btn_editart")!=null  ){
    %>                                                              
<form name="frmeditarseccion" action="editartarea.jsp">                                                                                                                         
<input type="hidden" name="txttcodigo" value="<%= request.getParameter("ta_codigo") %>" />
<input type="text" name="txttnombre" value="<%= request.getParameter("ta_descripcion") %>" />
<input type="hidden" name="txtscodigo" value="<%= request.getParameter("se_codigo") %>" />
<input type="hidden" name="txtptitulo" value="<%=request.getParameter("p_titulo")%>" />
<input type="hidden" name="txtsdescripcion" value="<%=request.getParameter("s_descripcion")%>" />
<input type="hidden" name="txtpcodigo" value="<%=request.getParameter("p_codigo")%>" />
<input type="submit" value="Editar" name="bt_agregar" />   
<a href="proyectos.jsp?p_codigo=<%=request.getParameter("p_codigo")%>&p_titulo=<%=request.getParameter("p_titulo")%>&se_codigo=<%=request.getParameter("se_codigo")%>&s_descripcion=<%= request.getParameter("s_descripcion") %>">Cancelar</a><div></div> 
  </form>      
<% } %>                    
                        <!--/.content-->
                    </div> <!--/.FIN TAREAS-->



                    
                      
                    <!--/.span9-->
                </div> <!--/.FIN SECCION-->
                                                                        
                                                                        
            </div> <!--/.FIN LAYOUT PRINCIPAL-->
            <!--/.container-->
        </div> <!--/.FIN TODA LA PAGINA-->
        <!--/.wrapper-->
        <div class="footer">
            <div class="container">
                <b class="copyright">&copy; Nestor Velasquez </b>All rights reserved.
            </div>
        </div>
        
        <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
        <script src="scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
        <script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="scripts/common.js" type="text/javascript"></script>
 
        
        <script src="js/modal.js"></script>
        
      
    </body>
            </html>
            
            
            
            

