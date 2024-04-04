package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;
import java.util.Random;

public class Animal {
    static void poblarAnimal(Connection conn, int numeroAnimales) throws SQLException {
        Faker faker = new Faker(new Locale("es"));
        Random random = new Random();

        String sql = "INSERT INTO animal (id, id_habitat, id_dieta, nombre, especie, sexo, edad, tamaño) VALUES ";
        for (int i = 1; i <= numeroAnimales; i++) {
            // Obtener id hábitat aleatorio
            int idHabitat = i;

            // Obtener id dieta aleatorio
            int idDieta = i;

            // Generar nombre aleatorio
            String nombre = faker.animal().name();

            // Generar especie aleatoria
            String[] especies = {"mamifero", "ave", "anfibio"};
            String especie = especies[random.nextInt(especies.length)];

            // Generar sexo aleatorio
            String sexo = faker.options().option("macho", "hembra");

            // Generar edad aleatoria
            int edad = random.nextInt(15) + 1; // Edad entre 1 y 15 años

            // Generar tamaño aleatorio
            double tamaño = faker.number().randomDouble(2, 1, 10); // Tamaño entre 1 y 10 metros

            sql += "('" + i + "', '" + idHabitat + "', '" + idDieta + "', '" + nombre + "', '" +
                    especie + "', '" + sexo + "', '" + edad + "', '" + tamaño + "')";

            if (i < numeroAnimales) {
                sql += ",";
            }
        }

        // Ejecutar la consulta
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
            //System.out.println(sql);
        }
    }
}
