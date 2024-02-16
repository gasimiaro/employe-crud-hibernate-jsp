/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Affecter;

import Model.Employe.Employe;
import Model.Lieu.Lieu;
import java.util.Date;

/**
 *
 * @author G A S I M I A R O
 */
public class Affecter {
//        private int affectId;
//
//    private int codeemp;
//    private int codelieu;
//    private Date date;
//    
    private AffecterId affectId;  // Composite identifier
    private Date date;

    // Include the employee and lieu field in the composite identifier
    private Employe employe;
    private Lieu lieu;

    public Affecter(){}
    
//    public Affecter(int affectId, int codeemp, int codelieu, Date date){
//                this.affectId = affectId;
//
//        this.codeemp = codeemp;
//        this.codelieu = codelieu;
//        this.date = date;
//    }
    public Affecter(AffecterId id, Employe employe, Lieu lieu, Date date) {
        this.affectId = id;
        this.date = date;
        this.employe = employe;
        this.lieu = lieu;
    }
// 
//       public void setAffectId(int affectId){
//        this.affectId = affectId;
//    }
//    public int getAffectId(){
//        return affectId;
//    } 
//    public void setCodeemp(int codeemp){
//        this.codeemp = codeemp;
//    }
//    public int getCodeemp(){
//        return codeemp;
//    }
//        
//    public void setCodelieu(int id){
//        this.codelieu = id;
//    }
//    public int getCodelieu(){
//        return codelieu;
//    }
//    
//    public void setDate(Date date){
//        this.date = date;
//    }
//    public Date getDate(){
//        return date;
//    }
//
    public AffecterId getAffectId() {
        return affectId;
    }

    public void setAffectId(AffecterId affectId) {
        this.affectId = affectId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    // Getter and Setter for the employee field
    public Employe getEmploye() {
        return employe;
    }

    public void setEmploye(Employe employee) {
        this.employe = employee;
    }
    
    public Lieu getLieu() {
        return lieu;
    }

    public void setLieu(Lieu lieu) {
        this.lieu = lieu;
    }
    @Override
    public String toString(){
        return "Personne [affecterId.codeEmp="+ affectId.getCodeEmp() +", employe.name="+employe.getNom()+ ", lieu.code="+lieu.getCodelieu()+ ", lieu.designation="+lieu.getDesignation()+", date="+date;
    }
}

