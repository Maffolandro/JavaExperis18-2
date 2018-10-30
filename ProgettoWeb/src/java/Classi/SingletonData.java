/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classi;

/**
 *
 * @author Corso
 */
public class SingletonData {
    private static SingletonData instance = null;
    private static String dbURL = "";
    private static String user = "";
    private static String pass = "";
    
    private SingletonData() {
        dbURL = "jdbc:oracle:thin:@localhost";
        user = "system";
        pass = "manpower";
    }
    
    public static SingletonData getInstance() {
        if (instance == null) {
            instance = new SingletonData();
        }
        return instance;
    }

    public String getDbURL() {return dbURL;}
    public String getUser() {return user;}
    public String getPass() {return pass;}
    
    
}
