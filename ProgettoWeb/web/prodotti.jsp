<%-- 
    Document   : prodotti
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
        <%
        // Controlla se è presente un ordine nella sessione
            beans.clsOrdine ordine = null;
            if (session.getAttribute("bean") == null) {
                // Se non è presente, creane uno nuovo e memorizzalo
                ordine = new beans.clsOrdine();
                session.setAttribute("bean", ordine);
            } else {
                // Altrimenti, carica il valore della sessione
                ordine = (beans.clsOrdine) session.getAttribute("bean");
            }
        %>
        <%@include file="Templates/headHTML.html" %>
        <% var1 = "class='active'"; //Imposta la prima voce come attiva%>
        <% if (ordine.getVoci().size() == 0) {
                // Se non sono presenti voci nell'ordine, nascondi il link per la sezione Ordini
                var2 = "class='hidden'";
            }
        %>
        <%@include file="Templates/menu.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizza prodotti</title>
    </head>
    <body>
        <div class="container">
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
                        // Per ogni riga nel database,...
                        while (rs.next()) {
                            // ...memorizza i dati dalla riga
                            int ID = rs.getInt("ID");
                            String nome = rs.getString("NOME");
                            String descrizione = rs.getString("DESCRIZIONE");
                            Double prezzo = rs.getDouble("PREZZO");

                            out.println("<tr>");
                            // Crea un form da usare per aggiungere la voce
                            out.println("<form action='aggiungiVoce.jsp'>");
                            out.println("<td>" + nome + "</td>");
                            out.println("<td>" + descrizione + "</td>");
                            out.println("<td>" + prezzo + "</td>");%>
                            <!-- Aggiungi i dati necessari come campi nascosti -->
                            <td>
                                <input name="ID" type="hidden" value="<%=ID%>"></input>
                                <input name="nome" type="hidden" value="<%=nome%>"></input>
                                <input name="prezzo" type="hidden" value="<%=prezzo%>"></input>
                                <input name="quantita" type="number" value="1" step="0.25" min="0" required></input>
                            </td>
                            <%
                            out.println("<td><input class='btn btn-info' type='submit' value='Aggiungi'></input></td>");
                            out.println("</form>");
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
