package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

public class Consulta {
    static void poblarConsulta(Connection conn, int numeroConsultas) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO consulta (id, id_animal, id_empleado, fecha, motivo) VALUES ";
        for (int i = 1; i <= numeroConsultas; i++) {
            // Obtener id animal aleatorio
            int idAnimal = i;

            // Obtener id empleado aleatorio
            int idEmpleado = i;

            // Generar fecha aleatoria
            Date fecha = faker.date().birthday();
            SimpleDateFormat formatoMySQL = new SimpleDateFormat("yyyy-MM-dd");
            String fechaMySQL = formatoMySQL.format(fecha);

            // Obtener motivo aleatorio
            String[] motivos = {"prevencion", "enfermedad", "nutricion"};
            String motivo = motivos[random.nextInt(motivos.length)];

            sql += "('" + i + "', '" + idAnimal + "', '" + idEmpleado + "', '" + fechaMySQL + "', '" + motivo + "')";

            if (i < numeroConsultas) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
            // System.out.println(sql);
        }
    }
}
