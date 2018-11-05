<%-- 
    Document   : rimuoviOrdine
    Created on : 31-ott-2018, 17.46.04
    Author     : Corso
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rimuovi voce</title>
    </head>
    <body>
        <%
            int ID = Integer.parseInt(request.getParameter("ID"));
            beans.clsOrdine ordine = (beans.clsOrdine) session.getAttribute("bean");
            ordine.removeVoce(ID);
            session.setAttribute("bean", ordine);
            String destinazione = "ordine.jsp";
            if (ordine.voci.size() == 0) {
                destinazione = "prodotti.jsp";
            }
                response.sendRedirect(destinazione);
        %>
    </body>
</html>
