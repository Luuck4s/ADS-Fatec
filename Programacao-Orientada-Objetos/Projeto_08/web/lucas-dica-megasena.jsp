<%-- 
    Document   : lucas-dica-megasena
    Created on : 27 de set de 2021, 22:47:29
    Author     : lucas
--%>
<% 
    String alreadyAuth = (String) session.getAttribute("auth-user");
    int numbers[] = new int[6];
    
    if(alreadyAuth != null){
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
        
        
        <% if(alreadyAuth != null){ %>
            <div class="p-5">


                        <div class="grid grid-cols-5">
                            <div class="border text-center font-bold p-2">Números da sorte</div>
                        </div>


                        <div  class="grid grid-cols-1 gap-10">
                            <% for(int i = 0; i <= 5; i++){ %>
                                <div><%=  numbers[i] %></div>
                            <% } %>
                        </div>

                    </div>
        <% } else { %>
            <h1>Você não tem permissão de visualizar o conteúdo.</h1>
        <% }  %>
    </body>
</html>
