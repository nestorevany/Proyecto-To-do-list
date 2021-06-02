
<%
    if (session.getAttribute("s_user") == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
 
