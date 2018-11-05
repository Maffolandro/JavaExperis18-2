<%-- 
    Document   : AggiungiVoce
    Created on : 31-ott-2018, 10.53.03
    Author     : Corso
--%>

<!--
    Aggiunge una voce al beans contenente l'ordine e torna alla pagina dei prodotti
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aggiungi voce ordine</title>
    </head>
    <body>
        <%
            // Carica l'ordine e i parametri richiesti
            beans.clsOrdine ordine = (beans.clsOrdine)session.getAttribute("bean");
            int id = Integer.valueOf(request.getParameter("ID"));
            String nome = request.getParameter("nome");
            double quantità = Double.parseDouble(request.getParameter("quantita"));
            double prezzo = Double.parseDouble(request.getParameter("prezzo"));
            // Aggiungi la voce all'ordine
            ordine.addVoce(id, nome, quantità, prezzo);
            // Memorizza l'ordine aggiornato
            session.setAttribute("bean", ordine);
            // Torna alla pagina prodotti.jsp
            response.sendRedirect("prodotti.jsp");
        %>
    </body>
</html>
