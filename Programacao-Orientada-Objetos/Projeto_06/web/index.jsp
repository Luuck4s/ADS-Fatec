<%-- 
    Document   : index
    Created on : 13 de set de 2021, 19:49:45
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .flex{
            display: flex;
        }
        .mx-5{
            margin-left: 5px;
            margin-right: 5px;
        }
    </style>
    <body>
        <div class="flex">
            <div class="mx-5">
                <%@include file="WEB-INF/jspf/menu.jspf" %>
            </div>

            <div class="mx-5">
                <%@include file="WEB-INF/jspf/header.jspf" %>

                <section>
                    <div>
                        <h1>Lucas Andrade de Lima</h1>
                        <p>RA:1290481922040</p>
                    </div>
                    
                </section>

                <%@include file="WEB-INF/jspf/footer.jsp" %>
            </div>
        </div>
    </body>
</html>
