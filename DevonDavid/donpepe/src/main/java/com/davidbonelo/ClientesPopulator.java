package com.davidbonelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ClientesPopulator extends TablePopulator {
    protected ClientesPopulator(PreparedStatement statement) {
        super(statement);
    }

    @Override
    public void setData(String[] data) throws SQLException {
        statement.setInt(1, Integer.parseInt(data[0])); // ID
        // All the other columns of `Cliente` are strings
        for (int i = 1; i < data.length; i++)
            this.statement.setString(i + 1, data[i]);
    }
}
