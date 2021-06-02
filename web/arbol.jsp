<!DOCTYPE html>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>

<html lang="en">
    <head>     
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../../assets/ico/favicon.png">

        <title>Bandeja</title>

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
    
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edmin</title>
        <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="css/theme.css" rel="stylesheet">
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
            rel='stylesheet'>
                
        
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

 <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="span3">
                        <div class="sidebar">
                            <ul class="widget widget-menu unstyled">
                                <li class="active"><a href="index.jsp"><i class="menu-icon icon-dashboard"></i>Dashboard
                                </a></li>
                                <li><a href="activity.html"><i class="menu-icon icon-bullhorn"></i>News Feed </a>
                                </li>
                                 <li><a href="Mi bandeja.jsp"><i class="menu-icon icon-bullhorn"></i>Bandeja </a>
                                </li>
                                <li><a href="message.html"><i class="menu-icon icon-inbox"></i>Inbox <b class="label green pull-right">
                                    11</b> </a></li>
                                <li><a href="task.html"><i class="menu-icon icon-tasks"></i>Tasks <b class="label orange pull-right">
                                    19</b> </a></li>
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
    
 <div class="buttons">
<a id="add-event" data-toggle="modal" href="#modal-add-event" class="btn btn-inverse btn-mini"><i class="icon-plus icon-white"></i> Agregar Nueva Tarea</a>									
</div>


   <form name="f1" action="Mi bandeja.jsp" method="POST">
       <table border="1" style="margin: 20 auto;">
            <tr>
                <td><center><h4>Nueva Seccion</h4></center></td>
        <br>
            </tr>
            <tr>
                <td>
                             <table border="0">
                                <tbody>
                                    <tr>
                                     
                                        <td>Seccion  </td>
                                        <td> <input type="text" name="ti_seccion" value="" /> </td>    
                                    </tr>
                                   
                                </tbody>
                            </table>
             <input type="submit" value="Crear Seccion" name="bt_crear" />
              <a href="Mi bandeja.jsp"><input type="button" value="Cancelar" name="btncancelar" /></a>                                                                
              </td>
            </tr>
        </table>                 
       </form>

                      
                                                                                   

        <div class="container">
            
            
<br>
<br>
            <h1>Bandeja de Entrada</h1>
         
<br>

<tbody>
            <table class="table tree2 table-bordered table-striped table-condensed">                                               
                
                               
                <tr class="treegrid-1">
                    <td>seccion 1</td><td>Additional info</td>
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
          
                
 </tbody>
 
            </table>
 
        </div> <!-- /container -->                     
                     
                        <!--/.content-->
                    </div>
                    <!--/.span9-->
                </div>
            </div>
            <!--/.container-->
        </div>
           

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
         <div class="footer">
            <div class="container">
                <b class="copyright">Nestor Velasquez </b>All rights reserved.
            </div>
        </div>
      
        
    </body>
    
    
</html>
