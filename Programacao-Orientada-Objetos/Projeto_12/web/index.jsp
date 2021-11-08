<%-- 
    Document   : index
    Created on : 8 de nov de 2021, 16:34:01
    Author     : lucas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="db.Tasks"%>
<%@page import="web.DbListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    Exception requestExecption = null;
    ArrayList<String> taskList = new ArrayList();

    try {

        if (request.getParameter("add") != null) {
            String taskName = request.getParameter("taskName");
            Tasks.addTask(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        
        if (request.getParameter("remove") != null) {
            String taskName = request.getParameter("taskName");
            Tasks.removeTask(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        
        taskList = Tasks.getTasks();
    } catch (Exception ex) {
        requestExecption = ex;
    }
    


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP - Lucas Andrade de Lima</title>
    </head>
    <body>
        <h1>JDBC - Lucas Andrade de Lima</h1>
        <h2><%= new java.util.Date() %> </h2>


        <% if (DbListener.exception != null) { %>
        <p>Error</p>
        <% } %>
        
        <% if (requestExecption != null) { %>
        <p>Error na criação</p>
        <% } %>

        <form>
            <input type="text" name="taskName" />
            <input type="submit" name="add" value="Adicionar" />
        </form>

        <table>
            <% for (String task : taskList) {%>
            <tr>
                <td><%= task %> </td>
                <td>
                    <form>
                        <input type="hidden" name="taskName" value="<%= task %>" />
                        <input type="submit" name="remove" value="-" />
                    </form>
                </td>
            </tr>
            <% }%>
        </table>
    </body>
</html>
