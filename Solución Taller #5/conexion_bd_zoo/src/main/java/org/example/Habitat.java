package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;
import java.util.Random;

public class Habitat {

    static void poblarHabitat(Connection conn, int numeroHabitats) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO habitat (id, nombre, ubicacion, clima, tipo) VALUES ";
        for (int i = 1; i <= numeroHabitats; i++) {
            // Generar nombre aleatorio
            String nombre = faker.animal().name();

            // Generar ubicacion aleatoria
            String ubicacion = faker.address().country();

            // Generar clima aleatorio
            String clima = faker.weather().description();

            // Generar tipo aleatorio
            String[] tipos = {"selva", "desierto", "montaña", "pradera", "humedales", "acuatico", "pantano"};
            String tipo = tipos[random.nextInt(tipos.length)];

            sql += "('" + i + "', '" + nombre + "', '" + ubicacion + "', '" + clima + "', '" + tipo + "')";

            if (i < numeroHabitats) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
        }
    }
}
