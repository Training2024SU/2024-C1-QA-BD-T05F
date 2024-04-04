package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;

public class Proveedor {
    static void poblarProveedor(Connection conn, int numeroProveedores) throws SQLException {
        Faker faker = new Faker(new Locale("es"));

        String sql = "INSERT INTO proveedor (id, nombre, email, direccion) VALUES ";
        for (int i = 1; i <= numeroProveedores; i++) {
            // Generar nombre aleatorio
            String nombre = faker.company().name();

            // Generar email aleatorio
            String email = faker.internet().emailAddress();

            // Generar dirección aleatoria
            String direccion = faker.address().streetAddress();

            sql += "('" + i + "', '" + nombre + "', '" + email + "', '" + direccion + "')";

            if (i < numeroProveedores) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
        }
    }
}
