<%-- 
    Document   : ordine
    Created on : 31-ott-2018, 12.15.39
    Author     : Corso
--%>

<!--
    Pagina contenente l'ordine dell'utente
-->

<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="Classi.SingletonData"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            // Controlla se è presente un ordine nella sessione
            beans.clsOrdine ordine = null;
            if (session.getAttribute("bean") == null) {
                // Se non è presente, creane uno nuovo e memorizzalo
                ordine = new beans.clsOrdine();
                session.setAttribute("bean", ordine);
            } else {
                // altrimenti, caricalo dalla sessione
                ordine = (beans.clsOrdine) session.getAttribute("bean");
            }%>
        <%@include file="Templates/headHTML.html" %> <!-- Carica la prima parte della home -->
        <% var2 = "class='active'"; %> <!-- Imposta la seconda voce nella barra di navigazione come attiva. -->
        <%@include file="Templates/menu.jsp" %> <!-- Carica il menù -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/funzioni.js"></script> <!-- Carica il file delle funzioni javascript -->
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
                    double totale = 0;
                    List<beans.clsOrdine.VoceOrdine> l = ordine.getVoci(); // Prendi l'elenco delle voci nell'ordine
                    for (beans.clsOrdine.VoceOrdine v : l) {
                        // Per ogni voce dell'ordine,...
                        out.println("<tr>");
                        // Carica i dati della voce
                        int ID = v.getIdProdotto();
                        String nome = v.getNome();
                        double quantità = v.getQuantità();
                        double prezzo = v.getPrezzo();
                        // Prepara i bottoni modifica e elimina voce
                        String modButton = "<a class='btn btn-info' role='button' onclick='modificaVoce(" + ID + ", " + quantità + ");'> Modifica </a>";
                        String delButton = "<a href='rimuoviVoce.jsp?ID=" + ID + "' class='btn btn-info' role='button'> Rimuovi </a>";
                        // Aggiungi i dati alla tabella
                        out.println("<td>" + nome + "</td>");
                        out.println("<td>" + quantità + "</td>");
                        out.println("<td>" + prezzo + "</td>");
                        out.println("<td>" + modButton + "</td>");
                        out.println("<td>" + delButton + "</td>");
                        out.println("</tr>");
                        totale += prezzo; // Aggiungi il prezzo al totale
                    }
                // Prepara il bottone di conferma ordine
                String confButton = "<a href='salvaOrdine.jsp' class='btn btn-info' role='button'> Conferma </a>";
                out.println("<tr>");
                    // Stampa il totale
                    out.println("<td><strong>TOTALE</strong></td>");
                    out.println("<td></td>");
                    out.println("<td>" + totale + "</td>");
                    out.println("<td></td>");
                out.println("</tr>");
                out.println("<td>" + confButton + "</td>");
                    
                %>
            </table>
        </div>
    </body>
</html>
