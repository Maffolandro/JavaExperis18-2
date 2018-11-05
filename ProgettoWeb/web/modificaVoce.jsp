<%-- 
    Document   : modificaOrdine
    Created on : 31-ott-2018, 17.46.14
    Author     : Corso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica voce</title>
    </head>
    <body>
        <%
            int ID = Integer.parseInt(request.getParameter("ID"));
            String temp = request.getParameter("quantita");
            double quantità = Double.parseDouble(temp);
            beans.clsOrdine ordine = (beans.clsOrdine) session.getAttribute("bean");
            ordine.updateVoce(ID, quantità);
            session.setAttribute("bean", ordine);
            response.sendRedirect("ordine.jsp");
        %>
    </body>
</html>
