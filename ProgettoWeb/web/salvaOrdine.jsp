<%-- 
    Document   : aggiungiOrdine
    Created on : 31-ott-2018, 14.47.54
    Author     : Corso
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="Classi.SingletonData"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salvataggio ordine...</title>
    </head>
    <body>
        <%
            beans.clsOrdine ordine = (beans.clsOrdine) session.getAttribute("bean");
            Date now = new Date(Calendar.getInstance().getTimeInMillis());
            Calendar d = Calendar.getInstance();
            Date our =new Date(d.getTime().getTime());
            int id_utente = 2;

            Connection conn = null;
            ResultSet rs = null;
            PreparedStatement stmt = null;
            try {
                SingletonData s = SingletonData.getInstance();
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection(s.getDbURL(), s.getUser(), s.getPass());

                // Memorizza il nuovo ordine
                String query = "INSERT INTO TB_ORDINI (NUM_ORDINE, DATA, ID_UTENTE)"
                        + " VALUES (" + 1 + ", ?, "
                        + id_utente + ")";
                stmt = conn.prepareStatement(query);
                stmt.setDate(1, our);
                stmt.executeUpdate();
                
                
                // Ottieni ID del nuovo ordine
                query = "SELECT MAX(ID) as max FROM TB_ORDINI";
                rs = stmt.executeQuery(query);
                rs.next();
                int ID_ordine = rs.getInt("max");
                
                List<beans.clsOrdine.VoceOrdine> l = ordine.getVoci();
                for (beans.clsOrdine.VoceOrdine v : l) {
                    int ID_Prodotto = v.getIdProdotto();
                    double quantità = v.getQuantità();
                    query = "INSERT INTO TB_VOCI_ORDINI (ID_PRODOTTO, QUANTITA, ID_ORDINE)"
                        + " VALUES (" + ID_Prodotto + ", " + quantità + ", " + ID_ordine + ")";
                    stmt.execute(query);
                }

            } catch (Exception e) {
                String junk = e.getLocalizedMessage();
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
            session.setAttribute("bean", new beans.clsOrdine());
            response.sendRedirect("prodotti.jsp");
        %>

    </body>
</html>
