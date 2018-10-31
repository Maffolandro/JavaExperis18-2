<%-- 
    Document   : AggiungiVoce
    Created on : 31-ott-2018, 10.53.03
    Author     : Corso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aggiungi voce ordine</title>
    </head>
    <body>
                <%
                beans.clsOrdine ordine = (beans.clsOrdine)session.getAttribute("bean");
                int id = Integer.valueOf(request.getParameter("ID"));
                String nome = request.getParameter("Nome");
                double quantità = Double.parseDouble(request.getParameter("Quantita"));
                ordine.addVoce(id, nome, quantità);
                session.setAttribute("bean", ordine);
                response.sendRedirect("prodotti.jsp");
                %>
                        
    </body>
</html>
