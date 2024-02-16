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

import Model.Employe.Employe;
import org.hibernate.Session;
import util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Transaction;

/**
 *
 * @author G A S I M I A R O
 */
public class EmployeManager {
    public void ajouterEmploye(String codeemp,String nom, String prenom, String poste){
       Session session = HibernateUtil.getSessionFactory().getCurrentSession();
       session.beginTransaction();
       Employe p = new Employe();
       p.setCodeemp(codeemp);
       p.setNom(nom);
       p.setPrenom(prenom);
       p.setPoste(poste);
       session.save(p);
       session.getTransaction().commit();
    }  
    
    
        public void modifierEmploye(String id, String nom, String prenom, String poste) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        // Charger la personne à modifier depuis la base de données
        Employe employe = (Employe) session.load(Employe.class, id);

        // Mettre à jour les attributs de la personne avec les nouvelles valeurs
        employe.setNom(nom);
        employe.setPrenom(prenom);
        employe.setPoste(poste);

        // Mettre à jour la personne dans la base de données
        session.update(employe);

        session.getTransaction().commit();
    }
    
public Employe[] listerEmploye() {
    Session session = null;
    Transaction transaction = null;
    Employe[] personneArray = null;

    try {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        transaction = session.beginTransaction();

        // Utiliser une requête HQL pour récupérer la liste triée par id
        Query query = session.createQuery("FROM Employe ORDER BY codeemp DESC");
        List<Employe> employes = query.list();

        // Convertir la liste en tableau sans créer un nouveau tableau
        personneArray = employes.toArray(new Employe[employes.size()]);

        transaction.commit();
    } catch (HibernateException e) {
        if (transaction != null) {
            transaction.rollback();
        }
        e.printStackTrace(); // Or handle the exception appropriately
    } finally {
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    return personneArray;
}




    public void supprimerEmploye(String id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        try {
            Employe employe = (Employe) session.get(Employe.class, id);
            session.delete(employe);
            session.getTransaction().commit();
        } catch (Exception e) {
//            session.getTransaction().rollback();
e.printStackTrace();
            throw e;
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }
    }
    
        public Employe getEmployeeByCode(String codeEmp) {
    Session session = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        Employe employee = (Employe)session.get(Employe.class, codeEmp);

        transaction.commit();

        return employee;
    } catch (Exception e) {
        // Log the exception or print the stack trace for debugging
        e.printStackTrace();
    } finally {
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    return null; // Return null in case of an exception
}
}
