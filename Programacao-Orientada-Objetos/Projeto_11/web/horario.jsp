<%-- 
    Document   : horario
    Created on : 29 de out de 2021, 21:05:45
    Author     : lucas
--%>

<%@page import="java.util.Date"%>
<%@page import="model.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Date agora = new Date();

    Horario horaAtual = new Horario(
            agora.getHours(),
            agora.getMinutes(),
            agora.getSeconds()
    );

    Horario horaIntervalo = new Horario(
            16,
            35,
            00
    );


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hora atual <%= horaAtual.horarioFormatado()%></h1>
        <h1>Hora intervalo <%= horaIntervalo.horarioFormatado()%></h1>
    </body>
</html>
