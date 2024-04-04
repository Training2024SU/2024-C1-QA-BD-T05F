package com.davidbonelo;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        System.out.println("Prueba de conexión a la base de datos DonPepe");
        // prueba de conexión usando solo jdbc
        jdbcPrueba();
        // prueba de conexión usando un ORM
//        hibernatePrueba();
    }

    private static void jdbcPrueba() {
        String connectionUrl = "jdbc:mysql://localhost:3307/supermercado";

        try (Connection conn = DriverManager.getConnection(connectionUrl, "root", "root1234")) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Almacenistas");
            ResultSet rs = ps.executeQuery();

            System.out.println("Almacenistas: ");
            while (rs.next()) {
                System.out.println(rs.getInt(1) + " " + rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    // a org.hibernate.SessionFactory should be created when the program starts, and closed when the program terminates.
    // but for demonstration purposes this method handles the entire session.
    private static void hibernatePrueba() {
        SessionFactory sessionFactory;
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().build();
        try {
            sessionFactory =
                    new MetadataSources(registry).addAnnotatedClass(Almacenista.class).buildMetadata().buildSessionFactory();

            System.out.println("Almacenistas: ");
            sessionFactory.inTransaction(session -> session.createSelectionQuery("from " +
                    "Almacenista", Almacenista.class).getResultList().forEach(a -> System.out.println(a.id + " " + a.nombre)));

            sessionFactory.close();
        } catch (Exception e) {
            StandardServiceRegistryBuilder.destroy(registry);
            System.out.println("Connection error: " + e.getMessage());
        }
    }
}