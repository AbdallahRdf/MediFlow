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
    @PrimaryKeyJoinColumn(name = "login_id")
    private Login loginID;

    public Admin(){}

    public Admin(int id, Login loginID, String cin, String firstName, String lastName, String email, String phone){
        super(id,cin,firstName,lastName,email,phone);
        this.loginID = loginID;
    }

    public Admin(int id, String cin, String firstName, String lastName, String email, String phone){
        super(id,cin,firstName,lastName,email,phone);
    }

    public Admin(Login loginID, String cin, String firstName, String lastName, String email, String phone){
        super(cin,firstName,lastName,email,phone);
        this.loginID = loginID;
    }

    public static Admin getByLogginID(Login login) {
        String hql = "FROM Admin WHERE loginID = :loginID";
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        Admin admin = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery(hql, Admin.class);
            query.setParameter("loginID", login);
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
