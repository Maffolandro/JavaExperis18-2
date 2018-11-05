<%-- 
    Document   : menu
    Created on : 26-ott-2018, 12.49.18
    Author     : Corso
--%>
<!--
    Contiene la barra di navigazione della parte utente.
    A seconda dei valori di var1 e var2, viene evidenziala la relativa voce
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Schermata utente</a>
    </div>
    <ul class="nav navbar-nav">
      <li <%=var1 %> ><a href="prodotti.jsp">Prodotti</a></li>
      <li <%=var2 %> ><a href="ordine.jsp">Ordine</a></li>
    </ul>
  </div>
</nav>