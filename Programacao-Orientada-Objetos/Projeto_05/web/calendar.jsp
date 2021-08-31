<%-- 
    Document   : calendar
    Created on : 30 de ago de 2021, 19:55:50
    Author     : lucas
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String errorMessage = null;
    int year = 0, month = 0, count = 1;
    Calendar calendar = Calendar.getInstance();
    String MONTHS[] = {
        "Janeiro",
        "Fevereiro",
        "Março",
        "Abril",
        "Maio",
        "Junho",
        "Julho",
        "Agosto",
        "Setembro",
        "Outubro",
        "Novembro",
        "Dezembro"
    };

    try {
        year = Integer.parseInt(request.getParameter("year"));
    } catch (Exception e) {
        errorMessage = "Erro ao ler o ano!";
    }
    try {
        month = Integer.parseInt(request.getParameter("month"));
        
        if(month > 12 || month < 0){
            errorMessage = "Mês inválido!";
        }else {

            if (month == 1) {
                month = 0;
            } else {
                month = month - 1;
            }
        }

        
        
        
    } catch (Exception e) {
        errorMessage = "Erro ao ler o mês!";
    }

    calendar.set(year, month, 1);
    int start = calendar.get(Calendar.DAY_OF_WEEK);

%>
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
        .grid-cols-7{
            grid-template-columns: repeat(7, minmax(0, 1fr));
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
    </style>
    <body>
        
        <% if(errorMessage != null){%>
        <div class="w-full text-center text-red">
            <h1><%= errorMessage %></h1>
        </div>
        <% } else { %>
            <h1 class="w-full text-center"><%= MONTHS[month] %> <%= year %></h1>
        
        <div class="grid grid-cols-7">
            <div class="border text-center font-bold p-2">Domingo</div>
            <div class="border text-center font-bold p-2">Segunda</div>
            <div class="border text-center font-bold p-2">Terça</div>
            <div class="border text-center font-bold p-2">Quarta</div>
            <div class="border text-center font-bold p-2">Quinta</div>
            <div class="border text-center font-bold p-2">Sexta</div>
            <div class="border text-center font-bold p-2">Sábado</div>
        </div>
        <div class="grid grid-cols-7">
            <% while (calendar.get(Calendar.MONTH) == month) { %>
                <% if (count < start) {%>
                    <div class="border p-5"></div>
                    <% count++; %>
                <%} else {%>
                    <div class="border p-5 text-center f-25"> 
                        <%= calendar.get(Calendar.DAY_OF_MONTH)%> 
                    </div>
                    <% calendar.add(Calendar.DATE, 1); %>
                <%}%>
            <% }%>
        </div>
        <% } %>
        
        
        
        <br/>
        
        <form action="calendar.jsp" class="flex ">
            <div class="mx-5">
                <label for="mes">Mês:</label>
                <input id="mes" type="number" value="<%= month + 1 %>" max="12" min="1"  name="month" /> 
            </div>
            
             <div class="mx-5">
                <label for="ano">Ano:</label>
                <input id="ano" type="number" name="year" value="<%= year %>" /> 
            </div>
            
           
            <input type="submit" value="Buscar">
        </form>
            
        <br/>
        
        <h3><a href="index.html">Voltar</a></h3>
    </body>
</html>
