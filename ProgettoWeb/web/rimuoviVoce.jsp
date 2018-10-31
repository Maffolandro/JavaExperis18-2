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
            List<beans.clsOrdine.VoceOrdine> l = ordine.getVoci();
                beans.clsOrdine.VoceOrdine da_rimuovere = null;
                for (beans.clsOrdine.VoceOrdine v : l) {
                    if (ID == v.getIdProdotto()) {
                        da_rimuovere = v;
                    }
                }
                l.remove(da_rimuovere);

        %>
    </body>
</html>
