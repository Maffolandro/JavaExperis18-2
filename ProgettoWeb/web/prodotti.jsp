<%-- 
    Document   : mostraLibri
    Created on : 25-ott-2018, 14.57.01
    Author     : Corso
--%>

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
        <% var1 = "class='active'"; %>
        <% if (ordine.getVoci().size() == 0) {
                var2 = "class='hidden'";
            }%>
        <%@include file="Templates/menu.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizza prodotti</title>
    </head>
    <body>
        <div class="container">
            <p><%=ordine.getVoci().size()%></p>
            <h1>Elenco dei prodotti presenti</h1>
            <table class='table'>
                <thead>
                <th>Prodotto</th>
                <th>Descrizione</th>
                <th>Prezzo</th>
                <th>Quantità</th>
                </thead>
                <%
                    Connection conn = null;
                    ResultSet rs = null;
                    Statement stmt = null;
                    try {
                        SingletonData s = SingletonData.getInstance();
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        conn = DriverManager.getConnection(s.getDbURL(), s.getUser(), s.getPass());

                        stmt = conn.createStatement();
                        String query = "SELECT * FROM TB_PRODOTTI";
                        rs = stmt.executeQuery(query);
                        while (rs.next()) {
                            int ID = rs.getInt("ID");
                            String nome = rs.getString("NOME");
                            String descrizione = rs.getString("DESCRIZIONE");
                            Double prezzo = rs.getDouble("PREZZO");

                            out.println("<tr>");
                            // Scrive l'ID nella prima riga
                            // out.println("<td>" + ID + "</td>");
                            // Genero un pulsante per cancellare // aggiungiProdotto.jsp?ID=" + ID + "
                            String addButton = "<a href='aggiungiVoce.jsp?ID=" + ID + "&Nome=" + nome + "&Quantita=" + 1 + "' class='btn btn-info' role='button'> Aggiungi </a>";

                            out.println("<td>" + nome + "</td>");
                            out.println("<td>" + descrizione + "</td>");
                            out.println("<td>" + prezzo + "</td>"); %>
                            <td></td>
                            <%out.println("<td>" + addButton + "</td>");
                            out.println("</tr>");
                        }

                        conn.close();
                    } catch (Exception e) {

                    } finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    }
                %>
            </table>
        </div>
    </body>
</html>
