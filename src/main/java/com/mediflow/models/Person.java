package com.mediflow.models;

import com.mediflow.utils.Hibernate;
import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

@MappedSuperclass
public class Person {
    // attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String cin;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "email")
    private String email;
    @Column(name = "tele")
    private String phone;

    // constructor
    public Person(){}

    public Person(int id, String cin, String firstName, String lastName, String email, String phone) {
        this.id = id;
        this.cin = cin;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }

    public Person(String cin, String firstName, String lastName, String email, String phone) {
        this.cin = cin;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }

    // getters
    public int getID() { return this.id; }
    public String getCIN() { return this.cin; }
    public String getFirstName() { return this.firstName; }
    public String getLastName() { return this.lastName; }
    public String getEmail() { return this.email; }
    public String getPhone() { return this.phone; }

    public <T> List<T> all(Class<T> clazz){
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        List<T> doctors = null;
        try {
            tx = session.beginTransaction();
            Query<T> query = session.createQuery("FROM " + clazz.getSimpleName(), clazz);
            doctors = query.list();
            tx.commit();
        } catch (Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return doctors;
    }

    public void create(){
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.persist(this);
            tx.commit();
        } catch (Exception e) {
            if(tx != null) tx.rollback();
            System.out.println("error during create: " + e.getMessage());
        } finally {
            session.close();
        }
    }

    public void update(){
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.merge(this);
            tx.commit();
        } catch (Exception e) {
            if(tx != null) tx.rollback();
            System.out.println("error during update: " + e.getMessage());
        } finally {
            session.close();
        }
    }

    public static <T> T get(Class<T> aClass, int id){
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        T object = null;
        try {
            tx = session.beginTransaction();
            object = session.get(aClass, id);
            tx.commit();
        } catch (Exception e){
            if(tx != null) tx.rollback();
            System.out.println("error during fetching the db: " + e.getMessage());
        } finally {
            session.close();
        }
        return object;
    }

    public static <T> void delete(Class<T> aClass, int id){
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            T object = session.get(aClass, id);
            session.remove(object);
            tx.commit();
        } catch (Exception e) {
            if(tx != null) tx.rollback();
            System.out.println("error during delete: " + e.getMessage());
        } finally {
            session.close();
        }
    }
}
