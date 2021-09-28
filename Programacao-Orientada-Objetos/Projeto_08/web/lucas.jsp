<%-- 
    Document   : lucas
    Created on : 27 de set de 2021, 22:39:47
    Author     : lucas
--%>
<% 
    String alreadyAuth = (String) session.getAttribute("auth-user");
    int counterUsersIntern = 0;
    if(application.getAttribute("counter-users") != null){
        counterUsersIntern = (int) application.getAttribute("counter-users");
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
            <h1>Lucas Andrade de Lima</h1>
            <p>RA:1290481922040</p>
            <p>Semestre de ingresso na Fatec: 2 semestre de 2019</p>
            <a href="https://github.com/Luuck4s" target="_blank">Github</a>
            
            
            
            <div class="p-5">


                        <div class="grid grid-cols-5">
                            <div class="border text-center font-bold p-2">Materias</div>
                        </div>


                        <div  class="grid grid-cols-1 gap-10">
                            <div> Programação Orientada a Objetos   </div>
                            <div> Estágio Supervisionado em Análise e Desenvolvimento de Sistemas  </div>
                            <div> Laboratório de Engenharia de Software - 4hs/aula  </div>
                            <div> Linguagem de Programação IV - INTERNET   </div>
                            <div> Programação para Dispositivos Móveis   </div>
                            <div> Segurança da Informação   </div>
                            <div> Inglês V    </div>
                            <div> Trabalho de Graduação I   </div>
                            
                        </div>

                    </div>
        <% } else { %>
            <h1>Você não tem permissão de visualizar o conteúdo.</h1>
        <% }  %>
    </body>
</html>
