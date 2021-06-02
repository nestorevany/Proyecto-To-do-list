<%@page import="modelo.JOConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
       
        <%
                   try{

         Connection con;
        PreparedStatement pst;
        ResultSet rs; 
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NESTORUSER","ITbenjamin1");
        
        String query = "select usu_correo,usu_contrasena,usu_codigo,usu_nombre from usuarios ";
        Statement st=con.createStatement();
      
        rs=st.executeQuery(query);                    
        String centinela="n";
         String codigo="";
         String nombre="";
        while(rs.next()){          
            if(       
            request.getParameter("txtcorreo").equals(rs.getString(1) )  &&
            request.getParameter("txtcontrasena").equals(rs.getString(2)) ){
                codigo = rs.getString(3);
                nombre = rs.getString(4);
                        centinela="s";
                    }
             
           }
           if(centinela.equals("s")){
            //guardar variables de session           
            session.setAttribute("s_user", request.getParameter("txtcorreo"));
            session.setAttribute("s_pass", request.getParameter("txtcontrasena"));
            session.setAttribute("ucodigo", codigo);
            session.setAttribute("unombre", nombre);
            //llamar jsp correspondiete desde linea de comando
            request.getRequestDispatcher("inicio.jsp").forward(request, response);
           }
           else{
               out.print("<script>alert('el usuario no existe')</script>");
               request.getRequestDispatcher("login.jsp").forward(request, response);
           }           
           con.close();
        Thread.sleep(1000);
           }
            catch(Exception e){     e.printStackTrace();      }
        %>