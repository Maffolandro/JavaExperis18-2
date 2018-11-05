<%-- 
    Document   : rimuoviVoce
    Created on : 31-ott-2018, 17.46.04
    Author     : Corso
--%>

<!-- Pagina usata per rimuovere una voce dall'ordine -->

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
            // Carica i dati necessari
            int ID = Integer.parseInt(request.getParameter("ID"));
            beans.clsOrdine ordine = (beans.clsOrdine) session.getAttribute("bean");
            // Rimuovi voce dall'ordine
            ordine.removeVoce(ID);
            // Aggiorna ordine
            session.setAttribute("bean", ordine);
            String destinazione = "ordine.jsp";
            if (ordine.voci.size() == 0) {
                // Se l'ordine non contiene elementi, vai nella pagina prodotti
                destinazione = "prodotti.jsp";
            }
            // Altrimenti vai nella pagina ordine;
            response.sendRedirect(destinazione);
        %>
    </body>
</html>
