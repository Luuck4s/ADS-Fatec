<%-- 
    Document   : index
    Created on : 20 de set de 2021, 17:00:34
    Author     : lucas
--%>
<%@page import="java.util.Stack"%>
<%@page import="java.util.Random"%>
<%  
    Random rand = new Random();
    int numbers[] = new int[6];
     

    if(request.getParameter("auth-login") != null){
       String username = request.getParameter("auth-username");
       session.setAttribute("auth-user", username);
        
        
       for(int i = 0; i <= 5; i++){
           session.setAttribute("number" + i, rand.nextInt(99) + 10);
       }
    
       
       response.sendRedirect(request.getRequestURI());
    } else if (request.getParameter("auth-logout") != null){
        session.removeAttribute("auth-user");
        session.removeAttribute("numbers");
        
        response.sendRedirect(request.getRequestURI());
    }
    

    if(session.getAttribute("number1") != null){
         for(int i = 0; i <= 5; i++){
           numbers[i] = Integer.parseInt((String.valueOf(session.getAttribute("number" + i))));
       }
    }
    
    
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
            
        <div>
            <% if(session.getAttribute("auth-user") == null) { %>          
            <form method="post">
                    <div>
                        <label>Login</label>
                        <input type="text" name="auth-username" required />
                    </div>
                    <div>
                        <label>Senha</label>
                        <input type="password" name="auth-password" required />
                    </div>
                    <div>
                        <input type="submit" name="auth-login" value="Entrar" />
                    </div>
                </form>
            <% } else { %>
                <p>Olá, seus números da sorte</p>
                <% for(int i = 0; i <= 5; i++){ %>
                    <p><%=  numbers[i] %></p>
                <% } %>
            <% } %>
           
        </div>
    </body>
</html>
