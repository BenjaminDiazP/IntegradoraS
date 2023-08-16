package com.sigma.sigma.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConector {

    final String DBNAME = "INTEGRADORA1", USER = "admin", PASSWORD = "zanahoria12", TIMEZONE = "America/Mexico_City", USESSL = "false", PUBLICKEY = "true",
            DDLAUTO = "true", HOST = "sigma-db.cqcp6ehwmaw6.us-east-1.rds.amazonaws.com";
    public Connection connect() {
        String dataSource =
                String.format("jdbc:mysql://%s:3306/%s?user=%s&password=%s&serverTimezone=%s&useSSL=%s&allowPublicKeyRetrieval=%s&createDatabaseIfNotExist= %s", HOST, DBNAME, USER, PASSWORD, TIMEZONE, USESSL, PUBLICKEY, DDLAUTO);
        try {
            DriverManager
                    .registerDriver(new com.mysql.jdbc.Driver());
            return DriverManager
                    .getConnection(dataSource);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
