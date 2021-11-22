<%-- 
    Document   : index
    Created on : 22 de nov de 2021, 15:41:40
    Author     : lucas
--%>

<%@page import="web.Task"%>
<%@page import="java.sql.Connection"%>
<%@page import="web.lucasDbListener"%>
<%@page import="db.LucasTasks"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String userIsLogged = (String) session.getAttribute("auth-user");
    ArrayList<Task> taskList = new ArrayList();

    if (request.getParameter("auth-login") != null) {
        String username = request.getParameter("auth-username");
        session.setAttribute("auth-user", username);

        response.sendRedirect(request.getRequestURI());
    } else if (request.getParameter("auth-logout") != null) {
        session.removeAttribute("auth-user");

        response.sendRedirect(request.getRequestURI());
    }

    if (userIsLogged != null) {
        if (request.getParameter("new-task") != null) {
            String taskName = request.getParameter("taskName");
            LucasTasks.addTask(taskName, userIsLogged);
            response.sendRedirect(request.getRequestURI());
        }
        if (request.getParameter("remove") != null) {
            Integer taskId = Integer.parseInt(request.getParameter("taskId"));
            LucasTasks.removeTask(taskId);
            response.sendRedirect(request.getRequestURI());
        }
        
        taskList = LucasTasks.getTasks(userIsLogged);
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        
        
        <% if (userIsLogged != null) { %>
        <form action="index.jsp" method="post">
            <input type="text" name="taskName" />
            <input type="submit" name="new-task" value="Nova Tarefa" />
        </form>
        
        <table>
            <% for (Task task : taskList) {%>
            <tr>
                <td>#<%= task.id %> - </td>
                <td><%= task.titulo %> </td>
                <td>
                    <form>
                        <input type="hidden" name="taskId" value="<%= task.id %>" />
                        <input type="submit" name="remove" value="-" />
                    </form>
                </td>
            </tr>
            <% }%>
        </table>
        <% } else { %>
            <p>Acesso não permitido, realize o login para visualizar e cadastrar novas tarefas</p>
        <% } %>
    </body>
</html>
