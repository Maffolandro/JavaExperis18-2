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
        <%@include file="Templates/headHTML.html" %>
        <% var1 = "class='active'"; %>
        <%@include file="Templates/menu.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina utente</title>
    </head>
    <body>
        <div class="container">
            <h1>Elenco dei prodotti presenti</h1>
            <table class='table'>
                <thead>
                <th>Prodotto</th>
                <th>Descrizione</th>
                <th>Prezzo</th>
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
                            String addButton = "<a href='' class='btn btn-info' role='button' onclick='return alert(\"Prodotto aggiunto!\");'> Aggiungi </a>";
                            
                            out.println("<td>" + nome + "</td>");
                            out.println("<td>" + descrizione + "</td>");
                            out.println("<td>" + prezzo + "</td>");
                            out.println("<td>" + addButton + "</td>");
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
