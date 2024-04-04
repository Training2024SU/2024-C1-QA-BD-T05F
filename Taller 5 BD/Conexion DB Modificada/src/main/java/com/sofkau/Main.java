package com.sofkau;

import com.github.javafaker.Faker;
import com.sofkau.integration.database.mysql.MySqlOperation;

import java.security.spec.RSAOtherPrimeInfo;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class Main {

    private static final String SERVER = "localhost";
    private static final String DATA_BASE_NAME = "barberia_house_man";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    private static final String SELECT_ALL_FROM_CLIENTE = String.format("select * from %s.cliente", DATA_BASE_NAME);
    private static final String INSERT_CLIENTE = "INSERT INTO cliente (id_cliente, cedula_cliente, nombre_cliente, apellido_cliente, profesion, correo, fecha_nacimiento, edad, direccion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String INSERT_TELEFONO_CLIENTE = "INSERT INTO telefono_cliente (id_cliente, telefono) VALUES (?, ?)";
    private static final MySqlOperation mySqlOperation = new MySqlOperation();
    public static Faker faker = new Faker();
    public static int id_cliente_general = faker.number().randomDigit();


    public static void main(String[] args) throws SQLException {
        openConnection();
        for (int i = 0; i < 21; i++) {
            insertIntoCliente();
            insertIntoTelefonoCliente();
            id_cliente_general = id_cliente_general + 1;
        }


        selectAllFromLibro();

        closeConnection();

        System.out.println(faker.numerify("###"));

    }

    public static void openConnection() {
        mySqlOperation.setServer(SERVER);
        mySqlOperation.setDataBaseName(DATA_BASE_NAME);
        mySqlOperation.setUser(USER);
        mySqlOperation.setPassword(PASSWORD);
    }

    public static void selectAllFromLibro() throws SQLException {
        mySqlOperation.setSqlStatement(SELECT_ALL_FROM_CLIENTE);
        mySqlOperation.executeSqlStatement();
        mySqlOperation.printResulset();
    }

    public static void insertIntoCliente() {

        // Generate random data
        int id_cliente = id_cliente_general;
        String cedula = faker.idNumber().valid();
        String nombre = faker.name().firstName();
        String apellido = faker.name().lastName();
        String profesion = faker.job().title();
        String correo = faker.internet().emailAddress();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        String fechaNacimiento = dateFormat.format(faker.date().birthday());
        int edad = faker.number().numberBetween(18, 80);
        String direccion = faker.address().fullAddress();

        // Execute the insert statement
        mySqlOperation.setSqlStatement(INSERT_CLIENTE);
        try {
            mySqlOperation.executeSqlStatementWithParameters(id_cliente, cedula, nombre, apellido, profesion, correo, fechaNacimiento, edad, direccion);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void insertIntoTelefonoCliente() {

        // Generate random data
        int id_cliente = id_cliente_general;
        String telefono = faker.phoneNumber().cellPhone();

        // Execute the insert statement
        mySqlOperation.setSqlStatement(INSERT_TELEFONO_CLIENTE);
        try {
            mySqlOperation.executeSqlStatementWithParameters(id_cliente, telefono);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void closeConnection() {
        mySqlOperation.close();
    }
}