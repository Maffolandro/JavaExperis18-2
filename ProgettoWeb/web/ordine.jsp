<%-- 
    Document   : ordine
    Created on : 31-ott-2018, 12.15.39
    Author     : Corso
--%>

<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="Classi.SingletonData"%>
<!DOCTYPE html>
<html>
    <head>
        <%beans.clsOrdine ordine = null;
            if (session.getAttribute("bean") == null) {
                ordine = new beans.clsOrdine();
                session.setAttribute("bean", ordine);
            } else {
                ordine = (beans.clsOrdine) session.getAttribute("bean");
            }%>
        <%@include file="Templates/headHTML.html" %>
        <% var2 = "class='active'"; %>
        <%@include file="Templates/menu.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizza carrello</title>
    </head>
    <body>
        <div class="container">
            <h1>Carrello</h1>
            <table class='table'>
                <thead>
                <th>Prodotto</th>
                <th>Quantità</th>
                <th>Prezzo</th>
                <th></th>
                <th></th>
                </thead>
                <%
                    List<beans.clsOrdine.VoceOrdine> l = ordine.getVoci();
                    for (beans.clsOrdine.VoceOrdine v : l) {
                        out.println("<tr>");
                        int ID = v.getIdProdotto();
                        String nome = v.getNome();
                        double quantità = v.getQuantità();
                        double prezzo = v.getPrezzo();
                        String modButton = "<a href='' class='btn btn-info' role='button'> Modifica </a>";
                        String delButton = "<a href='' class='btn btn-info' role='button'> Rimuovi </a>";
                        // aggiungiVoce.jsp?ID=" + ID + "
                        out.println("<td>" + nome + "</td>");
                        out.println("<td>" + quantità + "</td>");
                        out.println("<td>" + prezzo + "</td>");
                        out.println("<td>" + modButton + "</td>");
                        out.println("<td>" + delButton + "</td>");
                        out.println("</tr>");
                        
                    }
                    // Da qua:  SISTEMARE!!!
                String confButton = "<a href='confermaOrdine.jsp' class='btn btn-info' role='button'> Conferma </a>";
                out.println("<td>" + confButton + "</td>");
                    
                %>
            </table>
        </div>
    </body>
</html>
