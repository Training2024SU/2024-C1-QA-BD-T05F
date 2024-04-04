package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;
import java.util.Random;

public class EspecialidadEmpleado {
    static void poblarEspecialidadEmpleado(Connection conn, int numeroEmpleados) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO especialidad_empleado (dni_empleado, especialidad) VALUES ";
        for (int i = 1; i <= numeroEmpleados; i++) {
            // El dni_empleado es el mismo que el índice del bucle para simplificar
            String dniEmpleado = String.valueOf(i);

            // Obtener una especialidad aleatoria
            String[] especialidades = {"nutricion", "nutricion reproductiva",
                    "entrenamiento de comportamiento", "entrenamiento de exhibicion", "entrenamiento de bienestar",
                    "anestesiologia", "patologia", "medicina veterinaria general", "aves", "mamiferos", "cirugia", };

            String especialidad = especialidades[random.nextInt(especialidades.length)];

            sql += "('" + dniEmpleado + "', '" + especialidad + "')";

            if (i < numeroEmpleados) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
        }
    }
}
