package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

public class ItemFactura {
    static void poblarItemFactura(Connection conn, int numeroRegistros) throws SQLException {
        Random random = new Random();

        String sql = "INSERT INTO item_factura (id_alimento, id_factura, cantidad, precio_unitario, precio_total) VALUES ";
        for (int i = 1; i <= numeroRegistros; i++) {

            // Generar una cantidad aleatoria entre 1 y 10
            int cantidad = random.nextInt(10) + 1;

            // Generar un precio unitario aleatorio entre 10 y 100
            double precioUnitario = random.nextDouble() * 90 + 10;

            // Calcular el precio total
            double precioTotal = cantidad * precioUnitario;

            sql += "('" + i + "', '" + i + "', '" + cantidad + "', '" + precioUnitario + "', '" + precioTotal + "')";

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
