/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Corso
 */
public class clsOrdine {
    
    public List<VoceOrdine> voci;
    
    public class VoceOrdine {
        int idProdotto;
        String nome;
        double quantità;
        
        public VoceOrdine(int idProdotto, String nome, double quantità) {
            this.idProdotto = idProdotto;
            this.nome = nome;
            this.quantità = quantità;
        }

        public int getIdProdotto() {
            return idProdotto;
        }

        public String getNome() {
            return nome;
        }

        public double getQuantità() {
            return quantità;
        }

        public void setQuantità(double quantità) {
            this.quantità = quantità;
        }
        
        
    }
    
    
    public clsOrdine() {
        voci = new ArrayList();
    }
    
    public void addVoce(int idProdotto, String nome, double quantità) {
        voci.add(new VoceOrdine(idProdotto, nome, quantità)); 
    }
    
    public List getVoci() {
        return voci;
    }
    
    
}
