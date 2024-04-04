package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

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
            Alimento.poblarAlimentos(conn, 50);
            Dieta.poblarDieta(conn, 50);
            Habitat.poblarHabitat(conn, 50);
            Empleado.poblarEmpleados(conn, 50);
            EspecialidadEmpleado.poblarEspecialidadEmpleado(conn, 50);
            Animal.poblarAnimal(conn, 50);
            Consulta.poblarConsulta(conn, 50);
            AsearHabitat.poblarAsearHabitat(conn, 50);
            Proveedor.poblarProveedor(conn, 50);
            OrdenDeCompra.poblarOrdenDeCompra(conn, 50);
            ItemDeOrden.poblarItemDeOrden(conn, 50);
            Peso.poblarPeso(conn, 50);
            Factura.poblarFactura(conn, 50);
            ItemFactura.poblarItemFactura(conn, 50);
            Pago.poblarPago(conn, 50);


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




}
