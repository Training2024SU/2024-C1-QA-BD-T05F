package com.sofkau;

import com.github.javafaker.Faker;
import com.sofkau.integration.database.mysql.MySqlOperation;

import java.security.spec.RSAOtherPrimeInfo;
import java.sql.SQLException;
import java.util.UUID;

public class Main {

    private static final String SERVER = "localhost:3306";
    private static final String DATA_BASE_NAME = "tienda_don_pepe";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";


    private static final String INSERT_ = "";
    private static final MySqlOperation mySqlOperation = new MySqlOperation();

    public static void main(String[] args) throws SQLException {
        openConnection();

        // Insertar 10 registros en la tabla Almacen
        for (int i = 0; i < 10; i++) {
            insertIntoAlmacen(generateUniqueId(),generarNombre(), generarCapacidad(), generarUbicacion());
        }

        closeConnection();
    }

    public static void openConnection() {
        mySqlOperation.setServer(SERVER);
        mySqlOperation.setDataBaseName(DATA_BASE_NAME);
        mySqlOperation.setUser(USER);
        mySqlOperation.setPassword(PASSWORD);
    }

    public static void insertIntoAlmacen(int almacenId, String nombre, int capacidad, String ubicacion) {
        String sqlStatement = "INSERT INTO Almacen (almacen_id, nombre, capacidad, ubicacion) VALUES (" + almacenId + ", '" + nombre + "', " + capacidad + ", '" + ubicacion + "')";
        mySqlOperation.setSqlStatement(sqlStatement);
        mySqlOperation.executeSqlStatementVoid();
    }

    public static void closeConnection() {
        mySqlOperation.close();
    }

    // Generar datos aleatorios para los registros del Almacen
    public static String generarNombre() {
        Faker faker = new Faker();
        return faker.company().name();
    }

    public static int generarCapacidad() {
        Faker faker = new Faker();
        return faker.number().numberBetween(100, 1000); // Suponiendo que la capacidad está entre 100 y 1000
    }

    public static String generarUbicacion() {
        Faker faker = new Faker();
        return faker.address().fullAddress();
    }

    public static int generateUniqueId() {
        // Utilizar UUID para generar un ID único
        UUID uuid = UUID.randomUUID();
        // Tomar los primeros 8 caracteres del UUID y convertirlos a un número entero
        return Math.abs(uuid.toString().hashCode());
    }
}