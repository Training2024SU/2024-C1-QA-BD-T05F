package com.davidbonelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DonPepeDB {
    private static Connection connection;

    public static void startConnection() {
        String dbPassword = "root1234";
        String dbUser = "root";
        String connectionUrl = "jdbc:mysql://localhost:3307/supermercado";

        try {
            connection = DriverManager.getConnection(connectionUrl, dbUser, dbPassword);
            connection.setAutoCommit(false);
        } catch (Exception e) {
            System.out.println("Error de conexión a la db: " + e.getMessage());
        }
    }

    public static Connection getConnection() {
        return connection;
    }

    public static void closeConnection() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
