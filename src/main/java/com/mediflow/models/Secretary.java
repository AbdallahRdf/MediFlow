package com.mediflow.models;

import com.mediflow.utils.Hibernate;
import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

@Entity
@Table(name = "secretaries")
public class Secretary extends Person{

    @OneToOne
    Login login;

    public Secretary() {}

    public Secretary(int id, Login login, String cin, String firstName, String lastName, String email, String phone){
        super(id,cin,firstName,lastName,email,phone);
        this.login = login;
    }

    public Secretary(int id, String cin, String firstName, String lastName, String email, String phone){
        super(id,cin,firstName,lastName,email,phone);
    }

    public Secretary(Login login, String cin, String firstName, String lastName, String email, String phone){
        super(cin,firstName,lastName,email,phone);
        this.login = login;
    }

    public Secretary(String cin, String firstName, String lastName, String email, String phone){
        super(cin,firstName,lastName,email,phone);
    }

    public Login getLogin(){ return login; }
    public void setLogin(Login login){ this.login = login; }

    public static Secretary getByLogginID(Login login) {
        String hql = "FROM Secretary WHERE login = :loginID";
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        Secretary secretary = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery(hql, Secretary.class);
            query.setParameter("loginID", login);
            secretary = (Secretary) query.getSingleResult();
            tx.commit();
        } catch (Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return secretary;
    }

    public static void updateLoginID(Login login, String cin){
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("FROM Secretary WHERE cin = :cin", Secretary.class);
            query.setParameter("cin", cin);
            Secretary secretary = (Secretary) query.getSingleResult();
            System.out.println("from the secreatayr model: " + secretary.getEmail());
            secretary.setLogin(login);
            session.merge(secretary);
            tx.commit();
        } catch (Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}

