/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Employe;

/**
 *
 * @author G A S I M I A R O
 */
public class Employe {
    private String codeemp;
    private String nom;
    private String prenom;
    private String poste;
    
    public Employe(){}
    
    public Employe(String codeemp, String nom, String prenom, String poste){
        this.codeemp = codeemp;
        this.nom = nom;
        this.prenom = prenom;
        this.poste = poste;
    }
 
public String getCodeemp() {
    return codeemp;
}

public void setCodeemp(String codeemp) {
    this.codeemp = codeemp;
}
    
    public void setNom(String nom){
        this.nom = nom;
    }
    public String getNom(){
        return nom;
    }
    
    public void setPrenom(String prenom){
        this.prenom = prenom;
    }
    public String getPrenom(){
        return prenom;
    }
    
    public void setPoste(String poste){
        this.poste = poste;
    }
    public String getPoste(){
        return poste;
    }
    
    @Override
    public String toString(){
        return "Personne [id="+ codeemp + ", nom="+nom+", prenom="+prenom+",email="+poste;
    }
}

