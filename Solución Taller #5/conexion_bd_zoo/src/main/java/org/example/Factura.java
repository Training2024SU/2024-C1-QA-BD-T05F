package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
public class Factura {
    static void poblarFactura(Connection conn, int numeroRegistros) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO factura (id, id_proveedor, fecha, estado, total) VALUES ";
        for (int i = 1; i <= numeroRegistros; i++) {
            // El id del proveedor es el mismo que el índice del bucle para simplificar

            // Generar una fecha aleatoria
            Date fecha = faker.date().birthday();
            SimpleDateFormat formatoMySQL = new SimpleDateFormat("yyyy-MM-dd");
            String fechaMySQL = formatoMySQL.format(fecha);

            // Obtener un estado aleatorio
            String[] estados = {"pagada", "parcialmente pagada", "vencida", "cancelada", "anulada","pendiente"};
            String estado = estados[random.nextInt(estados.length)];

            // Generar un total aleatorio entre 1000 y 10000
            double total = random.nextDouble() * 9000 + 1000;

            sql += "('" + i + "', '" + i + "', '" + fechaMySQL + "', '" + estado + "', '" + total + "')";

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
