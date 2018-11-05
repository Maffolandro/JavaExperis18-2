<%-- 
    Document   : modificaOrdine
    Created on : 31-ott-2018, 17.46.14
    Author     : Corso
--%>

<!--
    Modifica una voce al beans contenente l'ordine e torna alla pagina dei prodotti
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica voce</title>
    </head>
    <body>
        <%
            // Carica l'ordine e i parametri richiesti
            int ID = Integer.parseInt(request.getParameter("ID"));
            String temp = request.getParameter("quantita");
            double quantità = Double.parseDouble(temp);
            beans.clsOrdine ordine = (beans.clsOrdine) session.getAttribute("bean");
            // Aggiorna la quantità all'ordine
            ordine.updateVoce(ID, quantità);
            // Memorizza l'ordine aggiornato
            session.setAttribute("bean", ordine);
            // Torna alla pagina ordine.jsp
            response.sendRedirect("ordine.jsp");
        %>
    </body>
</html>
