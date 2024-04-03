package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;
import java.util.Random;

public class PoblarBaseDeDatos {
    // Datos de conexión a la base de datos
    static final String URL = "jdbc:mysql://localhost:3306/zoo_santafe";
    static final String USER = "root";
    static final String PASSWORD = "password";

    public static void main(String[] args) {
        Connection conn = null;

        try {
            // Conexión a la base de datos
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // Poblar tablas
            // poblarAlimentos(conn, 20);
            // poblarEmpleados(conn, 20);

            System.out.println("Base de datos poblada exitosamente.");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar la conexión
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("Base de datos cerrada exitosamente.");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    static void poblarAlimentos(Connection conn, int numeroAlimentos) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO animal (nombre, dosis, tipo) VALUES ";
        for (int i = 1; i <= numeroAlimentos; i++) {
            String nombreAlimento = faker.food().sushi();
            int dosis = random.nextInt(100) + 1;
            String tipo = faker.beer().name();

            sql += "('" + nombreAlimento + "', '" + dosis + "', ' " + tipo + "')";

            if (i < numeroAlimentos) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            System.out.println(sql);
            // stmt.executeUpdate(sql);
        }
    }

    static void poblarEmpleados(Connection conn, int numeroEmpleados) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO empleado (cedula, nombre, fecha_nacimiento, direccion, telefono, email, salario, horario, rol) VALUES ";
        for (int i = 1; i <= numeroEmpleados; i++) {
            // Generar cedula de 8 caracteres aleatorios
            String cedula = faker.number().digits(8);

            // Generar nombre aleatorio
            String nombre = faker.name().fullName();

            // Generar fecha de nacimiento aleatoria
            String fechaNacimiento = faker.date().birthday().toString();

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
            String[] roles = {"Veterinario", "Gerente", "Entrenador", "Cuidador", "Logistica"};
            String rol = roles[random.nextInt(roles.length)];

            sql += "('" + cedula + "', '" + nombre + "', '" + fechaNacimiento + "', '" + direccion + "', '" +
                    telefono + "', '" + email + "', '" + salario + "', '" + horario + "', '" + rol + "')";

            if (i < numeroEmpleados) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            // stmt.executeUpdate(sql);
            System.out.println(sql);
            System.out.println("Registros de empleado insertados exitosamente.");
        }
    }
}
