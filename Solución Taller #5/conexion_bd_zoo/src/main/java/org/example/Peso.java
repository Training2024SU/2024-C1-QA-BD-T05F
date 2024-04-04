package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
public class Peso {
    static void poblarPeso(Connection conn, int numeroRegistros) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO peso (id, empleado_id, animal_id, fecha, peso) VALUES ";
        for (int i = 1; i <= numeroRegistros; i++) {
            // Generar una fecha aleatoria
            Date fecha = faker.date().birthday();
            SimpleDateFormat formatoMySQL = new SimpleDateFormat("yyyy-MM-dd");
            String fechaMySQL = formatoMySQL.format(fecha);

            // Generar un peso aleatorio entre 1 y 100
            double peso = random.nextDouble() * 100;

            sql += "('" + i + "', '" + i + "', '" + i + "', '" + fechaMySQL + "', '" + peso + "')";

            if (i < numeroRegistros) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
        }
    }
}
