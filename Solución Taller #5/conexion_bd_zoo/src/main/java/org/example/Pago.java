package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
public class Pago {
    static void poblarPago(Connection conn, int numeroRegistros) throws SQLException {
        Faker faker = new Faker(new Locale("es"));

        String sql = "INSERT INTO pago (id, id_factura, fecha) VALUES ";
        for (int i = 1; i <= numeroRegistros; i++) {
            // Los ids de factura y pago son el mismo que el índice del bucle para simplificar
            String idFactura = String.valueOf(i);

            // Generar una fecha aleatoria con Faker
            Date fecha = faker.date().birthday();
            SimpleDateFormat formatoMySQL = new SimpleDateFormat("yyyy-MM-dd");
            String fechaMySQL = formatoMySQL.format(fecha);

            sql += "('" + i + "', '" + idFactura + "', '" + fechaMySQL + "')";

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
