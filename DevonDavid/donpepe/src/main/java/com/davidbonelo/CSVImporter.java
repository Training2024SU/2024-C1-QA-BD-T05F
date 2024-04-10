package com.davidbonelo;

import java.io.BufferedReader;
import java.io.FileReader;


public class CSVImporter {
    public static int batchSize = 20;

    public static void insertCsvIntoTable(String csvFilePath, TablePopulator tablePopulator) {
        int count = 0;
        try {
            BufferedReader lineReader = new BufferedReader(new FileReader(csvFilePath));
            String lineText;
            // skip header line
            lineReader.readLine();

            // process lines
            while ((lineText = lineReader.readLine()) != null) {
                String[] data = lineText.split(",");

                tablePopulator.setData(data);
                tablePopulator.addBatch();

                count++;
                if (count % batchSize == 0) {
                    tablePopulator.executeBatch();
                }
            }
            // Execute remaining queries
            tablePopulator.executeBatch();
            tablePopulator.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
}
