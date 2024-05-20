package com.mediflow.models;


import com.mediflow.database.DBConnection;
import com.mediflow.enums.Role;
import com.mediflow.utils.Hibernate;
import jakarta.persistence.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.sql.*;

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

    public static boolean authenticate(String username, String password, String role) {
        boolean result = false;
        try {
            Connection conn = DBConnection.getConnection();
            String query = "SELECT * FROM login WHERE username = ? AND password = ? AND role = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, role);

            ResultSet resultSet = statement.executeQuery();
            result = resultSet.next(); // If result set has next, credentials are valid
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static Integer create(String username, String password, String role){
        String query1 = "INSERT INTO login(username, password, role) VALUES (?, ?, ?);";
        String query2 = "SELECT MAX(id) FROM login;";
        Integer id = null;
        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query1);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, role);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query2);
            if(resultSet.next()) {
                id = resultSet.getInt("MAX(id)");
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public static void delete(int id){
        String query = "DELETE FROM login WHERE id = ?";
        System.out.println(id);
        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
