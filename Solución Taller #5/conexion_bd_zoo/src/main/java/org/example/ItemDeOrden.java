package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
public class ItemDeOrden {

    static void poblarItemDeOrden(Connection conn, int numeroItems) throws SQLException {
        String sql = "INSERT INTO item_de_orden (codigo_alimento, id_orden_compra, cantidad) VALUES ";
        for (int i = 1; i <= numeroItems; i++) {

            // Generar una cantidad aleatoria entre 1 y 10 para cada ítem de orden
            int cantidad = (int) (Math.random() * 10) + 1;

            sql += "('" + i + "', '" + i + "', '" + cantidad + "')";

            if (i < numeroItems) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
        }
    }
}
