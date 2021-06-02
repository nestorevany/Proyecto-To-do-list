<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../../assets/ico/favicon.png">

        <title>TreeGrid for Bootstrap 2.3.x</title>

        <!-- Bootstrap core CSS -->
        <link href="tablaarbol/examples/bootstrap-2.3.2/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="tablaarbol/css/jquery.treegrid.css">
        <link rel="stylesheet" href="http://yandex.st/highlightjs/7.3/styles/default.min.css">
        <script src="http://yandex.st/highlightjs/7.3/highlight.min.js"></script>
		<script>hljs.initHighlightingOnLoad();</script>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script type="text/javascript" src="tablaarbol/js/jquery.treegrid.js"></script>
        <script type="text/javascript" src="tablaarbol/js/jquery.treegrid.bootstrap2.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.tree').treegrid();
                $('.tree2').treegrid({
                    expanderExpandedClass: 'icon-minus-sign',
                    expanderCollapsedClass: 'icon-plus-sign'
                });
            });
        </script>
    <script>
      (function(i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function() {
          (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
      })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

      ga('create', 'UA-43342702-1', 'maxazan.github.io');
      ga('send', 'pageview');

    </script>
    
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/maruti-style.css" />
<link rel="stylesheet" href="css/maruti-media.css" class="skin-color" /> 
      
    
    </head>

    <body>
 
<!--Header-part-->
<div id="header">
  <h1><a href="dashboard1.jsp">TodoisT</a></h1>
</div>
<!--close-Header-part--> 

<!--top-Header-messaages-->
<div class="btn-group rightzero"> <a class="top_message tip-left" title="Manage Files"><i class="icon-file"></i></a> 
    <a class="top_message tip-bottom" title="Manage Users"><i class="icon-user"></i></a> 
    <a class="top_message tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a> 
    <a class="top_message tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a> </div>
<!--close-top-Header-messaages--> 

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li class="" ><a title="" href="#"><i class="icon icon-user"></i> <span class="text">Perfil</span></a></li>
    <li class=" dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Mensajes</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#">new message</a></li>
        <li><a class="sInbox" title="" href="#">inbox</a></li>
        <li><a class="sOutbox" title="" href="#">outbox</a></li>
        <li><a class="sTrash" title="" href="#">trash</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>
    <li class=""><a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">Cerrar Sesion</span></a></li>
  </ul>
</div>
<div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-left" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-Header-menu-->

<div id="sidebar"><a href="bandeja.jsp" class="visible-phone"><i class="icon icon-home"></i> Bandeja de Entrada</a><ul>
    <li class="active"><a href="bandeja.jsp"><i class="icon icon-home"></i> <span>Bandeja de Entrada</span></a> </li>
    <li> <a href="charts.html"><i class="icon icon-signal"></i> <span>Graficos</span></a> </li>
        <li><a href="tables.html"><i class="icon icon-th"></i> <span>Tablas</span></a></li>
         <li><a href="calendar.html"><i class="icon icon-calendar"></i> <span>Calendario</span></a></li>
         <li><a href="chat.html"><i class="icon icon-inbox"></i> <span>Chats</span></a></li>           
    <li><a href="grid.html"><i class="icon icon-fullscreen"></i> <span>Etiquetas</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>Forms</span> <span class="label label-important">3</span></a>
      <ul>
        <li><a href="form-common.html">Basic Form</a></li>
        <li><a href="form-validation.html">Form with Validation</a></li>
        <li><a href="form-wizard.html">Form with Wizard</a></li>
      </ul>
    </li>
    <li><a href="#"><i class="icon icon-tint"></i> <span>Filtros</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-cog"></i> <span>Configuraciones</span> <span class="label label-important">4</span></a>
      <ul>
        <li><a href="index2.html">Dashboard2</a></li>
        <li><a href="gallery.html">Gallery</a></li>
        <li> <a href="widgets.html">Widgets</a></li>
        <li> <a href="interface.html">Elementos</a></li>
        <li> <a href="buttons.html">Buttons</a></li>
        
      </ul>
    </li>
  </ul>
</div>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="dashboard1.jsp" title="Ir a Inicio" class="tip-bottom"><i class="icon-home"></i> Inicio</a></div>
  </div>
  <div class="container-fluid">
   	<div class="quick-actions_homepage">
    <ul class="quick-actions">
         <li> <a href="bandeja.jsp"> <i class="icon-dashboard"></i> Mi Bandeja </a> </li>
          <li> <a href="hoy.jsp"> <i class="icon-book"></i> Hoy </a> </li>
          <li> <a href="proximo.jsp"> <i class="icon-calendar"></i> Proximo </a> </li>
          <li> <a href="proyectos.jsp"> <i class="icon-database"></i> Proyectos</a> </li>
          <li> <a href="tareas.jsp"> <i class="icon-survey"></i> Tareas </a> </li>
          <li> <a href="usuarios.jsp"> <i class="icon-people"></i> Usuarios </a> </li>
          <li> <a href="#"> <i class="icon-calendar"></i> Eventos </a> </li>
        </ul>
   </div>

  </div>
    
 <div class="container" >
<br>
<br>
            <h1>Bandeja de Entrada</h1>
         
<br>
            <table class="table tree2 table-bordered table-striped table-condensed">
                <tr class="treegrid-1">
                    <td>Seccion 1</td><td>Editar Programar Comentarios Mas</td>
                </tr>
                <tr class="treegrid-2 treegrid-parent-1">
                    <td>Tareas 1-1</td><td>Additional info</td>
                </tr>
                <tr class="treegrid-3 treegrid-parent-1">
                    <td>Node 1-2</td><td>Additional info</td>
                </tr>
                <tr class="treegrid-4 treegrid-parent-3">
                    <td>Sub-Tareas 1-2-1</td><td>Additional info</td>
                </tr>
                <tr class="treegrid-5">
                    <td>Seccion 2</td><td>Additional info</td>
                </tr>
                <tr class="treegrid-6 treegrid-parent-5">
                    <td>Node 2-1</td><td>Additional info</td>
                </tr>
                <tr class="treegrid-7 treegrid-parent-5">
                    <td>Node 2-2</td><td>Additional info</td>
                </tr>
                <tr class="treegrid-8 treegrid-parent-7">
                    <td>Node 2-2-1</td><td>Additional info</td>
                </tr>        
            </table>	           
        </div> 
    
</div>        
        
        


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
    </body>
</html>
