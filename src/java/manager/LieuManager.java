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

import Model.Lieu.Lieu;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import java.util.List;

import org.hibernate.Query;

/**
 *
 * @author G A S I M I A R O
 */
public class LieuManager {
    public void ajouterLieu(String Codelieu,String Designation, String Province){
       Session session = HibernateUtil.getSessionFactory().getCurrentSession();
       session.beginTransaction();
       Lieu l = new Lieu();
       l.setCodelieu(Codelieu);
       l.setDesignation(Designation);
       l.setProvince(Province);
       session.save(l);
       session.getTransaction().commit();
    }  
    
    
        public void modifierLieu(String id, String Designation, String Province) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        // Charger la personne à modifier depuis la base de données
        Lieu lieu = (Lieu) session.load(Lieu.class, id);

        // Mettre à jour les attributs de la personne avec les nouvelles valeurs
        lieu.setDesignation(Designation);
        lieu.setProvince(Province);

        // Mettre à jour la personne dans la base de données
        session.update(lieu);

        session.getTransaction().commit();
    }
    
public Lieu[] listerLieu() {
    Session session = HibernateUtil.getSessionFactory().openSession();

    // Utiliser une requête HQL pour récupérer la liste triée par id
    Query query = session.createQuery("FROM Lieu ORDER BY codelieu");
    List<Lieu> lieux = query.list();

    session.close();

    // Convertir la liste en tableau sans créer un nouveau tableau
    Lieu[] lieuArray = lieux.toArray(new Lieu[lieux.size()]);

    return lieuArray;
}



    public void supprimerLieu(String id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        try {
            Lieu lieu = (Lieu) session.get(Lieu.class, id);
            session.delete(lieu);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            throw e;
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }
    }
    
        public Lieu getLieuByCode(String codeLieu) {
            Session session = null;
            try{
         session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();

        Lieu lieu = (Lieu) session.get(Lieu.class, codeLieu);

        transaction.commit();
        return lieu;
            } catch (Exception e) {
        // Log the exception or print the stack trace for debugging
        e.printStackTrace();
    } finally {
        if (session != null && session.isOpen()) {
            session.close();
        }
    }
    return null;
    }
    
}
