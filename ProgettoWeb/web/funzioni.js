function modificaVoce(ID, quantità) {
    var qta = prompt("Inserire la nuova quantità.", quantità);
    if (/^\d+[.\d*]?$/.test(qta)) {
        qta = parseFloat(qta);
        location.assign("modificaVoce.jsp?ID=" + ID + "&quantita=" + qta);
    }
    else {
        alert("Il valore inserito non è un numero valido!");
    }
}