package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

public class OrdenDeCompra {
    static void poblarOrdenDeCompra(Connection conn, int numeroOrdenes) throws SQLException {
        Faker faker = new Faker(new Locale("es"));

        String sql = "INSERT INTO orden_de_compra (id, codigo_proveedor, cedula_empleado, fecha) VALUES ";
        for (int i = 1; i <= numeroOrdenes; i++) {
            // Los códigos de proveedor y empleado son los mismos que el índice del bucle para simplificar
            String codigoProveedor = String.valueOf(i);
            String codigoEmpleado = String.valueOf(i);

            Date fecha = faker.date().birthday();
            SimpleDateFormat formatoMySQL = new SimpleDateFormat("yyyy-MM-dd");
            String fechaMySQL = formatoMySQL.format(fecha);

            sql += "('" + i + "', '" + codigoProveedor + "', '" + codigoEmpleado + "', '" + fechaMySQL + "')";

            if (i < numeroOrdenes) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
            System.out.println("Registros de orden_de_compra insertados exitosamente.");
        }
    }
}
