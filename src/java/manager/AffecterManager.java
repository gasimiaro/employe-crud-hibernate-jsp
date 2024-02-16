/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package manager;

//import org.hibernate.Session;
//import bean.Personne;
//import java.util.List;
//import org.hibernate.Query;
//import util.HibernateUtil;
import org.hibernate.Criteria;

import manager.EmployeManager;
import Model.Affecter.Affecter;
import Model.Affecter.AffecterId;
import Model.Employe.Employe;
import Model.Lieu.Lieu;
import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import java.util.List;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import org.hibernate.Query;

/**
 *
 * @author G A S I M I A R O
 */
public class AffecterManager {
//    public void ajouterAffecter(int codeemp,int codelieu, Date date){
            public void ajouterAffecter(AffecterId id, Employe employe, Lieu lieu, Date date) {

       Session session = HibernateUtil.getSessionFactory().getCurrentSession();
       session.beginTransaction();
//       Affecter aff = new Affecter();
               Affecter aff = new Affecter(id, employe,lieu,date);

//       aff.setCodeemp(codeemp);
//       aff.setCodelieu(codelieu);
//       aff.setDate(date);
       session.save(aff);
       session.getTransaction().commit();
    }  
    
        public void supprimerAffecter(String codeEmp, String codeLieu) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        AffecterId id = new AffecterId(codeEmp, codeLieu);

        Affecter affecter = (Affecter) session.get(Affecter.class, id);

        session.delete(affecter);

        transaction.commit();
    }
        
    public List<Affecter> getAllData() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction tx = null;
        List<Affecter> affecterList = new ArrayList<>();

        try {
            tx = session.beginTransaction();

            // Use HQL to get all Affecter entities
            Query query = session.createQuery("FROM Affecter");
            affecterList = query.list();

            tx.commit();

            return affecterList;
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }

        // Return an empty list in case of an exception
        return affecterList;
    }
        public void modifierAffecter(String codeemp, String codelieu, Date date) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        AffecterId id = new AffecterId(codeemp, codelieu);

        // Charger la personne à modifier depuis la base de données
        Affecter affecter = (Affecter) session.load(Affecter.class, id);

        // Mettre à jour les attributs de la personne avec les nouvelles valeurs
        affecter.setDate(date);

        // Mettre à jour la personne dans la base de données
        session.update(affecter);

        session.getTransaction().commit();
    }
//    
public Affecter[] listerAffecter() {
    Session session = HibernateUtil.getSessionFactory().openSession();

    // Utiliser une requête HQL pour récupérer la liste triée par id
    Query query = session.createQuery("FROM Affecter");
    List<Affecter> affect = query.list();

    session.close();

    // Convertir la liste en tableau sans créer un nouveau tableau
    Affecter[] afecterArray = affect.toArray(new Affecter[affect.size()]);

    return afecterArray;
}
//public List<Affecter> listerAffecter() {
//    Session session = HibernateUtil.getSessionFactory().openSession();
//
//    // Utiliser une requête HQL pour récupérer la liste triée par id
//    Query query = session.createQuery("FROM Affecter");
//    List<Affecter> affect = query.list();
//
//    session.close();
//
//    // Convertir la liste en tableau sans créer un nouveau tableau
//
//    return affect;
//}        
//
//
//
//    public void supprimerLieu(int id) {
//        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//        session.beginTransaction();
//
//        try {
//            Lieu lieu = (Lieu) session.get(Lieu.class, id);
//            session.delete(lieu);
//            session.getTransaction().commit();
//        } catch (Exception e) {
//            session.getTransaction().rollback();
//            throw e;
//        } finally {
//            if (session.isOpen()) {
//                session.close();
//            }
//        }
//    }
    public Employe getEmpDetails(String codeEmp){
        EmployeManager em = new EmployeManager();
        Employe e = em.getEmployeeByCode(codeEmp);    
        return e;
    }
    
    public Lieu getLieuDetails(String codeLieu){
        LieuManager lm = new LieuManager();
        Lieu l = lm.getLieuByCode(codeLieu);    
        return l;
    }
}
