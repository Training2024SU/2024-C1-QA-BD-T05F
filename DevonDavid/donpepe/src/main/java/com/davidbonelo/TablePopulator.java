package com.davidbonelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public abstract class TablePopulator {
    protected final PreparedStatement statement;

    protected TablePopulator(PreparedStatement statement) {
        this.statement = statement;
    }

    public int getColumnCount() throws SQLException {
        return statement.getMetaData().getColumnCount();
    }

    /**
     * Implementations of this method should set the individual data into the statement with the
     * correct type
     *
     * @param data data to be inserted in the table
     */
    public abstract void setData(String[] data) throws SQLException;

    public void addBatch() throws SQLException {
        statement.addBatch();
    }

    public void executeBatch() throws SQLException {
        statement.executeBatch();
    }

    public void close() throws SQLException {
        statement.close();
    }
}
