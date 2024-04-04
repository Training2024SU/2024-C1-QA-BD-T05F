package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;
import java.util.Random;

public class Alimento {
    static void poblarAlimentos(Connection conn, int numeroAlimentos) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO alimento (id, nombre, dosis, tipo) VALUES ";
        for (int i = 1; i <= numeroAlimentos; i++) {
            String nombreAlimento = faker.food().sushi();
            int dosis = random.nextInt(100) + 1;
            String tipo = faker.food().spice();

            sql += "('"+ i + "', '" + nombreAlimento + "', '" + dosis + "', '" + tipo + "')";

            if (i < numeroAlimentos) {
                sql += ",";
            }
        }

        try (Statement stmt = conn.createStatement()) {
            System.out.println(sql);
            stmt.executeUpdate(sql);
        }
    }
}
