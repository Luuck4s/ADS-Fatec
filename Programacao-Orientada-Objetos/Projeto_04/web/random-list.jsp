<%-- 
    Document   : sum
    Created on : 30 de ago de 2021, 16:39:58
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String errorMessage = null;
    int n = 0;

    try {
        n = Integer.parseInt(request.getParameter("n"));
    } catch (Exception e) {
        errorMessage = "Erro ao ler n";
    }


%>
<html>
    <head>
        <title>Java EE JSP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
     
        
        <hr />
        
        <h1>Java EE</h1>
        <h2>Java Server Pages</h2>
        <h3>Números aleatórios</h3>
        <h3><a href="index.html">Voltar</a></h3>

        <% if (errorMessage == null) {%>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Número</th>
            </tr>
            <% for(int i = 1; i <= n; i++){ %>
            <tr>
                <td><%= i %></td>
                <td><%= ((int)(100 *Math.random())) %> </td>
            </tr>
            <% } %>
        </table>
        <%} else {%>
            <h5><%= errorMessage%></h5>
        <%}%>
        <br/>
            
         <form action="random-list.jsp">
            <input type="number" name="n" value="<%=n%>" />
            <input type="submit" value="gerar" />
        </form>
    </body>
</html>
