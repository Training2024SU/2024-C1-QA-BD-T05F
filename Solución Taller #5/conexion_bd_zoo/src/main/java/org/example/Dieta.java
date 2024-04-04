package org.example;
import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;
import java.util.Random;

public class Dieta {
    static void poblarDieta(Connection conn, int numeroDietas) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO dieta (id, id_alimento, horario, fecha, objetivo) VALUES ";
        for (int i = 1; i <= numeroDietas; i++) {

            // Obtener horario aleatorio
            String[] horarios = {"1 vez al día", "2 veces al día", "3 veces al día", "4 veces al día"};
            String horario = horarios[random.nextInt(horarios.length)];

            // Generar fecha aleatoria del dia que se creó dieta
            String fecha = faker.date().birthday().toString();

            // Obtener objetivo aleatorio
            String[] objetivos = {"prevención", "equilibrio", "enfermedad", "aumento de peso", "reproducción", "lactancia"};
            String objetivo = objetivos[random.nextInt(objetivos.length)];

            sql += "('" + i + "', '" + i + "', '" + horario + "', '" + fecha + "', '" + objetivo + "')";

            if (i < numeroDietas) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
        }
    }
}
