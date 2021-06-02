<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>


<!DOCTYPE html>
<html>
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
                        <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                         <%
                                                                                
        try{
           dba db = new dba();
        db.Conectar(); 
                db.query.execute("select anombre,aurl,acodigo from avatar where acodigo= '"+request.getParameter("eavatar")+"'");
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
                                <li><a href="login.jsp"><i class="menu-icon icon-signout"></i>Salir </a></li>
                            </ul>
                        </div>
                    <!--/.sidebar-->
                </div>
                <!--/.span3-->
                <div class="span9">
   
                                 
                    
                    <div class="content">
                        <div class="module">
                            <div class="module-body">
                                <div class="profile-head media">
                                    <a href="#" class="media-avatar pull-left">
                                      <%
                                                                                
        try{
           dba db = new dba();
        db.Conectar(); 
                db.query.execute("select aurl,acodigo from avatar where acodigo= '"+request.getParameter("eavatar")+"'");
                ResultSet rs1 = db.query.getResultSet();
                while (rs1.next()){
                String mostrar;
                mostrar = rs1.getString(1);
                       
  %>                                      
                     <%=mostrar%>
                     
  		 <%
                                                }
                                                db.desconectar();
                                            //Thread.sleep(1000);
                                            }catch(Exception e){
                                            e.printStackTrace();
                                        }
                                            %>                                      
                                        
                                        
                                        
                                        
                                    </a>
                                    <div class="media-body">
                                        <h4>
                                            <%=session.getAttribute("unombre")%> <small>Offline</small>
                                        </h4>
                                        <p class="profile-brief">
                                            Actualmente estás utilizando nuestro plan Gratuito. Todoist Premium tiene aún más características para 
                                            ayudarte a hacer tu mejor trabajo.
                                        </p>
                                        <div class="profile-details muted">
                                           
                                            
                                            <a href="avatar.jsp" class="btn"><i class="icon-user"></i>Cambiar Avatar </a>                                         
                                            <a href="inicio.jsp" class="btn"><i class="icon-lock"></i>Resetear Password </a>
                                      
                                            <a href="exportarpdf.jsp?pdfcodigo=<%=session.getAttribute("ucodigo")%>" class="btn"><i class="icon-file"></i>Exportar PDF </a>
                                          
                                        </div>
                                    </div>
                                </div>
                                <ul class="profile-tab nav nav-tabs">                                                                   
                                </ul>
                                <div class="profile-tab-content tab-content">
                                    <div class="tab-pane fade active in" id="activity">
                                        <div class="stream-list">
                                            <div class="media stream">                                          							
							<div class="module-body">
                                                            <h3>Informacion Personal</h3>
								<table class="table table-striped">
								  <thead>
									<tr>
									  
									  <th>Nombre</th>
									  <th>Apellido</th>
									  <th>Correo</th>                                                                          
                                                                          <th>Ubicacion</th>
									</tr>
								  </thead>
								  <tbody>
          
                                                                      
                                                                      
 <%
       
         try{
        dba db = new dba();
        db.Conectar(); 
        db.query.execute("select usu_codigo,usu_nombre,usu_apellido,usu_correo,usu_contrasena,ubicacion from usuarios where usu_codigo= '" + session.getAttribute("ucodigo") + "' ");
        ResultSet rs = db.query.getResultSet();     
        while(rs.next())
        {
           
            String nombre=rs.getString(2); 
            String apellido=rs.getString(3); 
            String correo=rs.getString(4); 
            String contrasena=rs.getString(5);             
            String ubicacion=rs.getString(6); 
           
             String codigo=rs.getString(1);  
                       
  %>   
                                    <tr>   
                                       
                                        <td><%=nombre %></td>
                                <td><%=apellido %></td>
                                <td><%=correo %></td>
                                
                                <td><%=ubicacion %></td>
                                        
                                        <td> 
                                            <a href="miperfil.jsp?p_cod=<%=codigo%>&p_eliminar=1" class="btn"><i class="icon-off"></i>Eliminar </a>
                                          <a href="miperfil.jsp?p_codigo=<%=codigo%>&p_nombre=<%=nombre%>&p_apellido=<%=apellido%>&p_correo=<%=correo%>&p_contrasena=<%=contrasena%>&p_tipo=<%=ubicacion%>&p_editar=1" class="btn" ><i class="icon-edit"></i>Modificar </a>
                                        </td>
                                    </tr>
                                    <%  }
                            db.desconectar();
 //Thread.sleep(1000);
                        }catch(Exception e){
                        e.printStackTrace();
                    }
 %>                                                                     
																
								  </tbody>
								</table>

								<br /> 
    <%//ELIMINAR
            if (request.getParameter("p_eliminar") != null) {
                try {
                   dba db = new dba();
                db.Conectar();                
                    int contador1;
                    contador1 = db.query.executeUpdate("DELETE FROM usuarios "
                                        + "WHERE usu_codigo = '"+request.getParameter("p_cod")+"'");
                    {
                        out.print("<script>alert('Cuenta eliminado, Crear nuevo Usuario');</script>");
                   }
                    
                   db.commit();
                   db.desconectar();
                   // Thread.sleep(1000);
                   response.sendRedirect("login.jsp");
               } catch (Exception e) {
                   e.printStackTrace();
               }
            }
            
        %>   
                                                                                                                                
<%
 //MODIFICAR un producto  
try
{ 
    if(request.getParameter("bt_modificar")!=null)
        {
        String codigo=request.getParameter("txtcodigo");  
        String nombre=request.getParameter("txtnombre");
        String apellido=request.getParameter("txtapellido");
        String correo=request.getParameter("txtcorreo"); 
        String contrasena=request.getParameter("txtcontrasena"); 
        String tipo=request.getParameter("txttipo"); 
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs; 
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
        pst=con.prepareStatement("update usuarios set usu_nombre = ?, usu_apellido=?, usu_correo=?, usu_contrasena=?, usu_tipo=? where usu_codigo = ?");
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
    // Thread.sleep(1000);
    }
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} %>

                                                                                                                             
                                                              
<%
//paso #2 si preciono el link para modificar
if( request.getParameter("p_editar")!=null  ){
    %>
    
    <hr>
    <h3>Modificar Mi Perfil</h3>
        <form name="f1" action="miperfil.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>                                         
                        <td>Nombre</td>
                        <td><input type="text" name="txtnombre" value="<%= request.getParameter("p_nombre") %>" /></td>                       
                        <td>Apellido</td>
                        <td><input type="text" name="txtapellido" value="<%= request.getParameter("p_apellido") %>" /></td>
                    </tr>
                    <tr>                        
                        <td>Correo</td>
                        <td><input type="text" name="txtcorreo" value="<%= request.getParameter("p_correo") %>" /></td>                                        
                        <td>Ubicacion</td>
                        <td><input type="text" name="txttipo" value="<%= request.getParameter("p_tipo") %>" /></td>
                        <td><input type="hidden" name="txtcodigo" value="<%= request.getParameter("p_codigo") %>" /></td>
                        <td><input type="hidden" name="txtcontrasena" value="<%= request.getParameter("p_contrasena") %>"/></td>
                    </tr>                   
                    <tr>
                        <td> <input type="submit" value="modificar" name="bt_modificar" />   </td>                                           
                        <td> <a href="miperfil.jsp"><input type="button" value="Cancelar" name="btncancelar" /></a> </td>                        
                    </tr>
                </tbody>
            </table>
        </form>

<%
}
%>    
    
    
                                                </div>
                                                
                                           
                                            
                                            <!--/.media .stream-->


                                             <div class="media stream">
                                                
                                                
                                                
                                                
                                            </div>
                                            <!--/.media .stream-->
                                        </div>
                                        <!--/.stream-list-->
                                    </div>
                                    
                                </div>
                            </div>
                            <!--/.module-body-->
                        </div>
                        <!--/.module-->
                    </div>
                    <!--/.content-->
                </div>
                <!--/.span9-->
            </div>
        </div>
        <!--/.container-->
    </div>
    <!--/.wrapper-->
    <div class="footer">
        <div class="container">
            <b class="copyright">&copy; 2020 Nestor Velasquez </b>All rights reserved.
        </div>
    </div>
    <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
    
    <script src="js/modal.js"></script>
    
</body>
</html>

