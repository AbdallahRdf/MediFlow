package com.mediflow.models;

import com.mediflow.enums.Role;
import com.mediflow.utils.Hibernate;
import jakarta.persistence.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

@Entity
@Table(name = "login")
public class Login {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String password;
    @Enumerated(EnumType.STRING)
    private Role role;

    public Login() {}

    public Login(int id, String username, String password, Role role){
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public Login(String username, String password, Role role){
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public int getId(){ return this.id; }
    public String getUsername(){ return this.username; }
    public String getPassword(){ return this.password; }
    public Role getRole(){ return this.role; }

    public void setId(int id) { this.id = id; }
    public void setUsername(String username) { this.username = username; }
    public void setPassword(String password) { this.password = password; }
    public void setRole(Role role) { this.role = role; }

    public static boolean authenticate(String username, String password, Role role) {
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        boolean result = false;
        try {
            tx = session.beginTransaction();
            // HQL query targeting the Login entity
            Query query = session.createQuery("FROM Login WHERE username = :username AND password = :password AND role = :role");
            // Set query parameters with named parameters
            query.setParameter("username", username);
            query.setParameter("password", password);
            query.setParameter("role", role);
            // Unique result expected (either the matching user or null)
            Login user = (Login) query.getSingleResult();
            result = user != null; // User object existence indicates valid credentials
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging library
        } finally {
            session.close();
        }
        return result;
    }

    public static Login getByUsername(String username) {
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        String hql = "FROM Login WHERE username = :username";
        Login login = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery(hql, Login.class);
            query.setParameter("username", username);
            login = (Login)query.getSingleResult();
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return login;
    }
}
