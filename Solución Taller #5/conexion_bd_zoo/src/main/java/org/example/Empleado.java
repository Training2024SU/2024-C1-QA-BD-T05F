package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

public class Empleado {
    static void poblarEmpleados(Connection conn, int numeroEmpleados) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO empleado (cedula, nombre, fecha_nacimiento, direccion, telefono, email, salario, horario, rol) VALUES ";
        for (int i = 1; i <= numeroEmpleados; i++) {
            // Generar cedula de 8 caracteres aleatorios

            // Generar nombre aleatorio
            String nombre = faker.name().fullName();

            // Generar fecha de nacimiento aleatoria
            Date fechaNacimiento = faker.date().birthday();
            SimpleDateFormat formatoMySQL = new SimpleDateFormat("yyyy-MM-dd");
            String fechaMySQL = formatoMySQL.format(fechaNacimiento);

            // Generar direccion aleatoria
            String direccion = faker.address().fullAddress();

            // Generar telefono aleatorio
            String telefono = faker.phoneNumber().phoneNumber();

            // Generar email aleatorio
            String email = faker.internet().emailAddress();

            // Generar salario aleatorio
            double salario = faker.number().randomDouble(2, 1000, 5000); // Salario entre 1000 y 5000

            // Generar horario aleatorio (diurno o nocturno)
            String horario = random.nextBoolean() ? "diurno" : "nocturno";

            // Generar rol aleatorio
            String[] roles = {"veterinario", "gerente", "entrenador", "cuidador", "logistica"};
            String rol = roles[random.nextInt(roles.length)];

            sql += "('" + i + "', '" + nombre + "', '" + fechaMySQL + "', '" + direccion + "', '" +
                    telefono + "', '" + email + "', '" + salario + "', '" + horario + "', '" + rol + "')";

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
