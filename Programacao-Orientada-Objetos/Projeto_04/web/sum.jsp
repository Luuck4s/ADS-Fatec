<%-- 
    Document   : sum
    Created on : 30 de ago de 2021, 16:39:58
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String errorMessage = null;
    double n1 = 0, n2 = 0, result;

    try {
        n1 = Double.parseDouble(request.getParameter("n1"));
    } catch (Exception e) {
        errorMessage = "Erro ao ler n1";
    }

    try {
        n2 = Double.parseDouble(request.getParameter("n2"));
    } catch (Exception e) {
        errorMessage = "Erro ao ler n2";
    }

    result = n1 + n2;


%>
<html>
    <head>
        <title>Java EE JSP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Java EE</h1>
        <h2>Java Server Pages</h2>
        <h3>Soma</h3>
        <h3><a href="index.html">Voltar</a></h3>

        <% if (errorMessage == null) {%>
        <h4><%= n1 %> + <%= n2 %> = <%= result %></h4>
        <%} else {%>
        <h5><%= errorMessage%></h5>
        <%}%>
            
        <form action="sum.jsp">
            <input type="number" name="n1" value="5" />
            <input type="number" name="n2" value="4" />
            <input type="submit" value="Somar" />
        </form>
    </body>
</html>
