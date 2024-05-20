package com.mediflow.models;

import com.mediflow.database.DBConnection;
import com.mediflow.utils.Hibernate;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "patients")
public class Patient extends Person{

    public Patient() {
        super();
    }

    public Patient(int id, String cin, String firstName, String lastName, String email, String phone){
        super(id, cin, firstName, lastName, email, phone);
    }

    public Patient(String cin, String firstName, String lastName, String email, String phone){
        super(cin, firstName, lastName, email, phone);
    }

//    public static List<Patient> all(){
//        Session session = Hibernate.getSessionFactory().openSession();
//        List<Patient> patients = null;
//        try {
//            session.beginTransaction();
//            Query<Patient> query = session.createQuery("FROM Patient ", Patient.class);
//            patients = query.list();
//            session.getTransaction().commit();
//        } catch (Exception e) {
//            if(session.getTransaction() != null){
//                session.getTransaction().rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return patients;
//    }


//    public static ArrayList<Patient> all() {
//        String query = "SELECT * FROM patients";
//        try {
//            Connection connection = DBConnection.getConnection();
//            Statement statement = connection.createStatement();
//            ResultSet result = statement.executeQuery(query);
//            ArrayList<Patient> patients = new ArrayList<>();
//            while(result.next()){
//                patients.add(new Patient(
//                        result.getInt("id"),
//                        result.getString("cin"),
//                        result.getString("first_name"),
//                        result.getString("last_name"),
//                        result.getString("email"),
//                        result.getString("tele")
//                ));
//            }
//            result.close();
//            statement.close();
//            connection.close();
//            return patients;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//
//    public static Patient get(int id) {
//        String query = "SELECT * FROM patients WHERE id = ?";
//        Patient patient = null;
//        try {
//            Connection connection = DBConnection.getConnection();
//            PreparedStatement statement = connection.prepareStatement(query);
//            statement.setInt(1, id);
//            ResultSet result = statement.executeQuery();
//            if(result.next()){
//                patient = new Patient(
//                        result.getInt("id"),
//                        result.getString("cin"),
//                        result.getString("first_name"),
//                        result.getString("last_name"),
//                        result.getString("email"),
//                        result.getString("tele")
//                );
//            }
//            result.close();
//            statement.close();
//            connection.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return patient;
//    }
//
//    public static Patient get(String cin) {
//        String query = "SELECT * FROM patients WHERE cin = ?";
//        Patient patient = null;
//        try {
//            Connection connection = DBConnection.getConnection();
//            PreparedStatement statement = connection.prepareStatement(query);
//            statement.setString(1, cin);
//            ResultSet result = statement.executeQuery();
//            if(result.next()){
//                patient = new Patient(
//                        result.getInt("id"),
//                        result.getString("cin"),
//                        result.getString("first_name"),
//                        result.getString("last_name"),
//                        result.getString("email"),
//                        result.getString("tele")
//                );
//            }
//            result.close();
//            statement.close();
//            connection.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return patient;
//    }

//    public static void create(String cin, String firstName, String lastName, String email, String phone) {
//        String query = "INSERT INTO patients(cin, first_name, last_name, email, tele) VALUES (?, ?, ?, ?, ?)";
//        try {
//            Connection connection = DBConnection.getConnection();
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, cin);
//            preparedStatement.setString(2, firstName);
//            preparedStatement.setString(3, lastName);
//            preparedStatement.setString(4, email);
//            preparedStatement.setString(5, phone);
//            preparedStatement.executeUpdate();
//            preparedStatement.close();
//            connection.close();
//        } catch(SQLException e){
//            e.printStackTrace();
//        }
//    }
//
//    public static void delete(int id) {
//        String query = "DELETE FROM patients WHERE id = ?";
//        try {
//            Connection connection = DBConnection.getConnection();
//            PreparedStatement statement = connection.prepareStatement(query);
//            statement.setInt(1, id);
//            statement.executeUpdate();
//            statement.close();
//            connection.close();
//        } catch(SQLException e){
//            e.printStackTrace();
//        }
//    }
//
//    public static void update(int id,String cin, String firstName, String lastName, String email, String phone) {
//        String query = "UPDATE patients SET first_name = ?, last_name = ?, email = ?, tele = ?, cin=? WHERE id = ?";
//        try {
//            Connection connection = DBConnection.getConnection();
//            PreparedStatement statement = connection.prepareStatement(query);
//            statement.setString(1, firstName);
//            statement.setString(2, lastName);
//            statement.setString(3, email);
//            statement.setString(4, phone);
//            statement.setString(5, cin);
//            statement.setInt(6, id);
//            statement.executeUpdate();
//            statement.close();
//            connection.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//
//    public static int getIDByFullName(String firstName, String lastName) {
//        String query = "SELECT id FROM patients WHERE first_name = ? AND last_name = ?";
//        int patient = 0;
//        try {
//            Connection connection = DBConnection.getConnection();
//            PreparedStatement statement = connection.prepareStatement(query);
//            statement.setString(1, firstName);
//            statement.setString(2, lastName);
//            ResultSet result = statement.executeQuery();
//            if(result.next()){
//                patient = result.getInt("id");
//            }
//            result.close();
//            statement.close();
//            connection.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return patient;
//    }
}
