<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="database.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
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
        
           <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
        <link rel="stylesheet" href="css/data-table/bootstrap-table.css">
        <link rel="stylesheet" href="css/data-table/bootstrap-editable.css">
        <link rel="stylesheet" href="css/modal.css">

</head>

  <script> 
           function mod(pid,pnp,pd,pep,pp,pe){
                var modal2 = document.getElementById("myModal");
                modal.style.display = "block"; 
                document.getElementById("idh1").value=pid;
                document.getElementById("ids1").value=pnp;
                document.getElementById("ids2").value=pd;
                document.getElementById("ids3").value=pep;
                document.getElementById("ids4").value=pp;
                document.getElementById("ids5").value=pe;
                
           }
    
    </script>
        
        
        
    </head>
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                        <i class="icon-reorder shaded"></i></a><a class="brand" href="index.html">Edmin </a>
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
                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown
                                <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Item No. 1</a></li>
                                    <li><a href="#">Don't Click</a></li>
                                    <li class="divider"></li>
                                    <li class="nav-header">Example Header</li>
                                    <li><a href="#">A Separated link</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Support </a></li>
                            <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="images/user.png" class="nav-avatar" />
                                <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Your Profile</a></li>
                                    <li><a href="#">Edit Profile</a></li>
                                    <li><a href="#">Account Settings</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Logout</a></li>
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
                                <li><a href="inicio.jsp"><i class="menu-icon icon-tasks"></i>Hoy<b class="label orange pull-right">
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
        db.query.execute("select proy_codigo, proy_titulo, usu_codigo from proyectos where usu_codigo= '" + session.getAttribute("ucodigo") + "' ");
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
                                            }catch(Exception e){
                                            e.printStackTrace();
                                        }
                                            %>
                                                </tbody>
                                            </table>                                          
                                             <a href="#"><input type="button" value="Agregar Proyecto" name="btnagregar" /></a> 
                                        </li>
                                        
                                    </ul>
                                </li>
                               
                            </ul>
                            <!--/.widget-nav-->
                            
                            
                            <ul class="widget widget-menu unstyled">
                                <li><a href="ui-button-icon.html"><i class="menu-icon icon-bold"></i> Buttons </a></li>
                                <li><a href="ui-typography.html"><i class="menu-icon icon-book"></i>Typography </a></li>
                                <li><a href="form.html"><i class="menu-icon icon-paste"></i>Forms </a></li>
                                <li><a href="table.html"><i class="menu-icon icon-table"></i>Tables </a></li>
                                <li><a href="charts.html"><i class="menu-icon icon-bar-chart"></i>Charts </a></li>
                            </ul>
                            <!--/.widget-nav-->
                            <ul class="widget widget-menu unstyled">
                                <li><a class="collapsed" data-toggle="collapse" href="#togglePages"><i class="menu-icon icon-cog">
                                </i><i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right">
                                </i>More Pages </a>
                                    <ul id="togglePages" class="collapse unstyled">
                                        <li><a href="other-login.html"><i class="icon-inbox"></i>Login </a></li>
                                        <li><a href="other-user-profile.html"><i class="icon-inbox"></i>Profile </a></li>
                                        <li><a href="other-user-listing.html"><i class="icon-inbox"></i>All Users </a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><i class="menu-icon icon-signout"></i>Logout </a></li>
                            </ul>
                        </div>
                        <!--/.sidebar-->
                    </div>
                    <!--/.span3-->
                    <div class="span9">


<%//INSERT
    if(request.getParameter("bt_crear")!=null)
        {
        String nombre=request.getParameter("ti_nombre");
        String apellido=request.getParameter("ti_apellido");
        String correo=request.getParameter("ti_correo"); 
        String contrasena=request.getParameter("ti_contrasena"); 
        String tipo=request.getParameter("ddl_p"); 
        
        
         try{
                dba db = new dba();
                db.Conectar();

        db.query.executeUpdate("insert into usuarios "
                                        + "(usu_nombre,usu_apellido,usu_correo,usu_contrasena,ubicacion)"
                                       + "values('"+ nombre +"'" 
                                        + ",'"+apellido+"'"
                                        + ",'"+correo+"'"
                                        + ",'"+contrasena+"'"                                            
                                       + ",'"+ tipo +"')");
        
out.print("<script>alert('Registro creado ');</script>");
                db.commit();
                db.desconectar();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        %>

    <%//ELIMINAR
            if (request.getParameter("p_editar") != null) {
                try {
                   dba db = new dba();
                db.Conectar();                
                    int contador1;
                    contador1 = db.query.executeUpdate("DELETE FROM usuarios "
                                        + "WHERE usu_codigo = '"+request.getParameter("p_id")+"'");
                    {
                        out.print("<script>alert('Registro eliminado correctamente');</script>");
                   }
                   db.commit();
                   db.desconectar();
               } catch (Exception e) {
                   e.printStackTrace();
               }
            }
        %>     
        
<%
 //MODIFICAR un producto   
    if(request.getParameter("bt_modificar")!=null)
        {
        String codigo=request.getParameter("ti_codigo");  
        String nombre=request.getParameter("ti_nombre");
        String apellido=request.getParameter("ti_apellido");
        String correo=request.getParameter("ti_correo"); 
        String contrasena=request.getParameter("ti_contrasena"); 
        String tipo=request.getParameter("ti_tipo"); 
        
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
    }
  %> 
                                           
                        
  <div class="sparkline13-hd">
                                <div class="main-sparkline13-hd">
                                    <Center><h1>Lista de Usuarios</h1></center>
                                </div>
                            </div>

<div id="myModal" class="modal" style="margin: 0 auto;">  
  <div class="modal-content">
    <span class="close">&times;</span>
    <p> <form name="fM1" action="usuarios.jsp" method="POST">
        
        <table border="1" style="margin: 0 auto;">
            <tr>
                <td><center><h4>Modificar Usuario</h4></center></td>
            </tr>
            <tr>
                <td>
                    <table border="0">
                                <tbody>
                                    <tr>
                                        <td>Nombre  </td>
                                        <td> <input id="ids1" type="text" name="ti_nombre" value="" /> </td>    
                                        <td>Apellido</td>
                                        <td><input id="ids2" type="text" name="ti_apellido" value="" /></td>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td>Correo</td>
                                        <td><input id="ids3" type="text" name="ti_correo" value="" />
                                        <br>
                                        </td>
                                        <td>Contraseña</td>
                                        <td><input id="ids4" type="text" name="ti_contrasena" value="" /></td>
                                       
                                    </tr>
                                    <tr>
                                         <td>Ubicacion</td>
                                        <td><input id="ids5" type="text" name="ti_tipo" value="" /></td>
                                        <td>Codigo</td>
                                        <td><input id="idh1" type="text" name="ti_codigo" value="" readonly="readonly" /></td>
                                       
                                    </tr>
                                </tbody>
                            </table>         
              <input type="submit" value="Modificar Usuario" name="bt_modificar" />
              <a href="usuarios.jsp"><input type="button" value="Cancelar" name="btncancelar" /></a>
              
              </td>
            </tr>
        </table>
       </form>    
    </p>
  </div>
</div>
                        
  
 <form name="f1" action="usuarios.jsp" method="POST">
        <table border="1" width="50">
            <tr>
                <td><center><h4>Nuevo</h4></center></td>
            </tr>
            <tr>
                <td>
                             <table border="0">
                                <tbody>
                                    <tr>
                                     
                                        <td>Nombre  </td>
                                        <td> <input type="text" name="ti_nombre" value="" /> </td>    
                                        <td>Apellido</td>
                                        <td><input type="text" name="ti_apellido" value="" /></td>
                                        
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Correo</td>
                                        <td><input type="text" name="ti_correo" value="" />
                                        <br>
                                        </td>
                                        <td>Contraseña</td>
                                        <td><input type="password" name="ti_contrasena" value="" /></td>
                                       
                                    </tr>
                                    
                                    <tr>
                                         
                                        <td>Ubicacion</td>                                                                             
                                        <td>
                                            <select name="ddl_p">
                                            <option>15.50417, -88.025</option>
                                            <option>15.61444, -87.95302</option>
                                        </select> 
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
              <input type="submit" value="Crear Usuario" name="bt_crear" /><br>                      
              </td>
            </tr>
        </table>
       </form>  
  
                        
                        
                                <!-- LISTA USUARIOS -->
                            <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                                   data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                <thead>
                                    <tr>

                                        <th data-field="id">CODIGO</th>
                                        <th data-field="nombre" data-editable="false">NOMBRE</th>
                                        <th data-field="apellido" data-editable="false">APELLIDO</th>
                                        <th data-field="correo" data-editable="false">CORREO</th>
                                        <th data-field="contrasena" data-editable="false">CONTRASENA</th>
                                        <th data-field="tipousuario" data-editable="false">UBICACION</th>
                                    
                                        <th data-field="operaciones" data-editable="false">OPERACIONES</th>
                                    </tr>
                                </thead>
                                <tbody>

                                   <%
       
         try{
        dba db = new dba();
        db.Conectar(); 
        db.query.execute("select usu_codigo,usu_nombre,usu_apellido,usu_correo,usu_contrasena,ubicacion from usuarios");
        ResultSet rs = db.query.getResultSet();     
        while(rs.next())
        {
            String codigo=rs.getString(1);  
            String nombre=rs.getString(2); 
            String apellido=rs.getString(3); 
            String correo=rs.getString(4); 
            String contrasena=rs.getString(5); 
            
            String ubicacion=rs.getString(6); 
           
                       
  %>   
                                    <tr>   
                                        <td><%=codigo%></td>
                                        <td><%=nombre %></td>
                                <td><%=apellido %></td>
                                <td><%=correo %></td>
                                <td><%=contrasena %></td>
                                <td><%=ubicacion %></td>
                                        
                                        <td> <input type="button" value="Eliminar" 
                                                    onclick="window.location='usuarios.jsp?p_id=<%=rs.getString("usu_codigo") %>&p_editar=1'"/>
                                             <input type="button" value="Modificar" 
                                                    onclick="mod('<%=codigo%>','<%=nombre%>','<%=apellido%>','<%=correo%>','<%=contrasena%>','<%=ubicacion%>')"/>

                                        </td>
                                    </tr>
                                    <%  }
                            db.desconectar();
                        }catch(Exception e){
                        e.printStackTrace();
                    }
 %>
                                   

                                </tbody>
                            </table>
                                    
                        
                        
                        
                        

                        
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
        
        <!-- jquery
                    ============================================ -->
        <script src="js/vendor/jquery-1.11.3.min.js"></script>
        <!-- bootstrap JS
                    ============================================ -->
       

        <!-- data table JS
                    ============================================ -->
        <script src="js/data-table/bootstrap-table.js"></script>
        <script src="js/modal.js"></script>
        <script src="js/data-table/tableExport.js"></script>
        <script src="js/data-table/data-table-active.js"></script>
        <script src="js/data-table/bootstrap-table-editable.js"></script>
        <script src="js/data-table/bootstrap-editable.js"></script>
        <script src="js/data-table/bootstrap-table-resizable.js"></script>
        <script src="js/data-table/colResizable-1.5.source.js"></script>
        <script src="js/data-table/bootstrap-table-export.js"></script>

        <!-- tab JS
                    ============================================ -->
        <script src="js/tab.js"></script>
 
        
      
    </body>

