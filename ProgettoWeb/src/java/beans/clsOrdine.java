/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;

/**
 *
 * @author Corso
 */
public class clsOrdine {
    
    ArrayList<VoceOrdine> voci;
    
    class VoceOrdine {
        int idProdotto;
        String nome;
        int quantità;
    }
    
    
    public clsOrdine() {
        voci = new ArrayList();
    }
    
}
