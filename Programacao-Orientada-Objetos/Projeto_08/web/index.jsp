<%-- 
    Document   : index
    Created on : 27 de set de 2021, 22:27:07
    Author     : lucas
--%>
<%
    int counterUsers = 0;
    String alreadyAuthHome = (String) session.getAttribute("auth-user");
    
    if(application.getAttribute("counter-users") != null){
        counterUsers = (int) application.getAttribute("counter-users");
    }
    
    ArrayList<String> usersIntern = new ArrayList<String>();
    
    if(alreadyAuthHome != null){
        for(int i = 0; i < counterUsers; i++){
           String user = (String.valueOf(application.getAttribute("user" + i)));
           
           if(user != null){
               usersIntern.add(user);
           }
       }
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lucas Andrade App</title>
    </head>
    <style>
       .grid {
            display: grid;
        }
        .grid-cols-5{
            grid-template-columns: repeat(5, minmax(0, 1fr));
        }
        .grid-cols-1{
            grid-template-columns: repeat(1, minmax(0, 1fr));
        }
        .mb-5 {
            margin-bottom: 1.25rem;
        }
        .text-center{
            text-align: center;
        }
        .w-full{
            width: 100%;
        }
        .border {
            border: 1px solid;
        }
        .p-2{
            padding: 1.25rem;
        }
        .p-5{
            padding: 2rem;
        }
        .f-25{
            font-size: 25px;
        }
        .font-bold{
            font-weight: bold;
        }
        .flex{
             display: flex;
        }
        
        .mx-5{
            margin-left: 5px;
            margin-right: 5px;
        }
        .text-red{
            color: red;
        }
        .gap-10{
            gap: 10px;
        }
    </style>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        
        
        <section>
            <div>
                <h4>Total de usuários ativos no momento: <%= counterUsers %></h4>
                
            </div>
                
            <div>
                <h4>Usuário logados</h4>
                <div  class="grid grid-cols-1 gap-10">
                    <% for(int i = 0; i < usersIntern.size(); i++){ %>
                        <div><%=  usersIntern.get(i) %></div>
                    <% } %>
                </div>
            </div>
            
        </section>
    </body>
</html>
