package org.example;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class AsearHabitat {

    static void poblarAsearHabitat(Connection conn, int numeroHabitats) throws SQLException {
        String sql = "INSERT INTO asear_habitat (habitat_id, empleado_dni) VALUES ";
        for (int i = 1; i <= numeroHabitats; i++) {
            // Usar el mismo ID de hábitat como empleado_dni para simplificar la demostración
            sql += "('" + i + "', '" + i + "')";

            if (i < numeroHabitats) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
            //System.out.println("Registros de asear_habitat insertados exitosamente.");
        }
    }
}
