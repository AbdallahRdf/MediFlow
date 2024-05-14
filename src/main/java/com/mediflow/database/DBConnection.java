package com.mediflow.database;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost/hospital_appointment_system";
    private static String USERNAME;
    private static String PASSWORD;

    public static Connection getConnection() {
        loadDataCredentials();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void loadDataCredentials() {
        Properties props = new Properties();
        try (InputStream input = DBConnection.class.getResourceAsStream("/config.properties")) {
            if (input == null) {
                System.out.println("Unable to find config.properties file");
                return;
            }
            props.load(input);
            USERNAME = props.getProperty("username");
            PASSWORD = props.getProperty("password");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
