package com.mediflow.models;

import com.mediflow.utils.Hibernate;
import jakarta.persistence.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;


@Entity()
@Table(name = "admins")
public class Admin extends Person{

    @OneToOne
    private Login login;

    public Admin(){}

    public Admin(int id, Login loginID, String cin, String firstName, String lastName, String email, String phone){
        super(id,cin,firstName,lastName,email,phone);
        this.login = loginID;
    }

    public Admin(int id, String cin, String firstName, String lastName, String email, String phone){
        super(id,cin,firstName,lastName,email,phone);
    }

    public Admin(Login loginID, String cin, String firstName, String lastName, String email, String phone){
        super(cin,firstName,lastName,email,phone);
        this.login = loginID;
    }

    public Login getLogin() { return login; }
    public void setLogin(Login login) { this.login = login; }

    public static void update(int id, String cin, String firstName, String lastName, String email, String phone, String username) {
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Admin admin = session.get(Admin.class, id);
            admin.setCin(cin);
            admin.setFirstName(firstName);
            admin.setLastName(lastName);
            admin.setPhone(phone);
            admin.setEmail(email);
            admin.getLogin().setUsername(username);
            session.merge(admin);
            tx.commit();
        } catch (Exception e) {
            if(tx != null) tx.rollback();
            System.out.println("error during update of admin: " + e.getMessage());
        } finally {
            session.close();
        }
    }

    public static Admin getByLogginID(Login login) {
        String hql = "FROM Admin WHERE login = :login";
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        Admin admin = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery(hql, Admin.class);
            query.setParameter("login", login);
            admin = (Admin) query.getSingleResult();
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return admin;
    }

}
