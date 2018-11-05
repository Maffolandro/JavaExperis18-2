/*
 * File contenente le funzioni javascript utilizzate
 */

function modificaVoce(ID, quantità) {
    /*
     * Gestisce la modifica una voce dell'ordine dell'utente
     */
    // Richiede all'utente la nuova quantità
    var qta = prompt("Inserire la nuova quantità.", quantità);
    // Controlla che il valore in valore inserito sia effettivamente un numero
    if (/^\d+[.\d*]?$/.test(qta)) {
        // Chiama la pagina modificaVoce.jsp passandogli l'id della voce da modificare e la nuova quantità
        qta = parseFloat(qta);
        location.assign("modificaVoce.jsp?ID=" + ID + "&quantita=" + qta);
    }
    else {
        // Avverti l'utente
        alert("Il valore inserito non è un numero valido!");
    }
}