<%-- 
    Document   : tabela-price
    Created on : 13 de set de 2021, 20:01:51
    Author     : lucas
--%>

 <%
        double pv = 0, i = 0, n = 0;
        double pmt = 0;
        double aux = 0;
        double a = 0;
        double originalValue = 0;
        double jurosAc = 0;
        Boolean hasValues = false;
        
        try {
            pv = Double.parseDouble(request.getParameter("value"));
            i = Double.parseDouble(request.getParameter("juros"));
            n = Double.parseDouble(request.getParameter("mes"));
            
            if(pv > 0){
                i = i / 100;
                originalValue = pv;
                hasValues =  true;
           
            }
            
            
           
        } catch (Exception ex) {
            
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
        <div class="flex">
            <div class="mx-5">
                <%@include file="WEB-INF/jspf/menu.jspf" %>
            </div>

            <div class="mx-5">
                <%@include file="WEB-INF/jspf/header.jspf" %>

                <form action="tabela-price.jsp">
                    <div class="mx-5">
                        <label for="value">Valor:</label>
                        <input id="value" type="number" value="<%= pv %>" name="value" /> 
                    </div>
                    <div class="mx-5">
                        <label for="mes">Meses:</label>
                        <input id="mes" type="number" name="mes" value="<%= n %>" /> 
                    </div>
                    <div class="mx-5">
                        <label for="juros">Taxa de Juros(%):</label>
                        <input id="juros" type="number" name="juros" value="<%= i * 100 %>" /> 
                    </div>
                    <input type="submit" value="Calcular">
                </form>
                    
                <% if(hasValues){ %>
                
                    <div class="p-5">


                        <div class="grid grid-cols-5">
                            <div class="border text-center font-bold p-2">Período</div>
                            <div class="border text-center font-bold p-2">Saldo Devedor</div>
                            <div class="border text-center font-bold p-2">Parcela</div>
                            <div class="border text-center font-bold p-2">Juros</div>
                            <div class="border text-center font-bold p-2">Amortização</div>                        
                        </div>


                        <div  class="grid grid-cols-5 gap-10">
                            <% for(int index = 0; index <= n; index++){ %>
                                <% 

                                    if(index != 0){
                                        aux = 1 / Math.pow((1 + i), n);
                                        aux = 1- aux;

                                        pmt = (originalValue * i) / aux;

                                        jurosAc = (pv * i);
                                        pv = pv - pmt;
                                        pv += jurosAc; 


                                        a = pmt - jurosAc;
                                    }


                                %>
                                <div> <%= index %> </div>
                                <div> <%= String.format("R$ %.2f",pv)  %> </div>
                                <div> <%= index > 0 ? String.format("R$ %.2f",pmt) : "" %> </div>
                                <div> <%= index > 0 ? String.format("R$ %.2f", jurosAc) : "" %> </div>
                                <div> <%= index > 0 ? String.format("R$ %.2f",a) : "" %> </div>
                            <% } %>
                        </div>

                    </div>
                <% } %>

                <%@include file="WEB-INF/jspf/footer.jsp" %>
            </div>
        </div>
    </body>
</html>
