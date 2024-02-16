/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;
//import Model.Personne;
import Model.Affecter.Affecter;
import Model.Affecter.AffecterId;
import Model.Employe.Employe;
import Model.Lieu.Lieu;

import java.util.List;
import util.HibernateUtil;
//import manager.PersonneManager;
import manager.AffecterManager;
import manager.EmployeManager;
import manager.LieuManager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author G A S I M I A R O
 */
public class Test_Main {
    
    
    public static void main(String[] args){
//        PersonneManager pm = new PersonneManager();
        EmployeManager em = new EmployeManager();
        LieuManager lm = new LieuManager();
        AffecterManager am = new AffecterManager();
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        Date d = new Date();


//        pm.ajouterPersonne("James", "Gasimiaro", "0349257412", "james@test.com");
//        em.ajouterEmploye("E001","James", "feno", "Direct");
//        lm.ajouterLieu( "L003","Tana", "Analamaanga");
//        am.ajouterAffecter(1, 2, d);
        AffecterId affecterId = new AffecterId("E003", "L003");
        Date date = new Date("20001-02-01");  
        Employe employee = new Employe();
        Lieu lieu = new Lieu();

//        // Add a new Affecter
        am.ajouterAffecter(affecterId, employee, lieu, date);
//        
//
////        pm.modifierPersonne(2, "Doe", "Jane", "987654321", "jane.doe@example.com");
//        Employe[] list = em.listerEmploye();
//        for (Employe personne : list) {
//            System.out.println("ireto : " + personne);
//        }
//        List<Affecter> list1 = am.getAllData();
        Affecter[] list1 = am.listerAffecter();

                for (Affecter aff : list1) {
            System.out.println("ireto : " + aff);
        }
//    Personne[] personneArray = pm.listerPersonnes();
//    for (Personne personne : personneArray) {
//        System.out.println("ireto : " + personne);
//    }
    
//        pm.supprimerPersonne(5);

        HibernateUtil.sessionFactory.close();
    }
}
