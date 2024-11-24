/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {

    private static final String URL = "jdbc:sqlserver://DESKTOP-BRTUO67\\SERVER_PTTKHT:1433;databaseName=model;encrypt=true;trustServerCertificate=true";
//    private static final String USER = "yourUsername";
//    private static final String PASSWORD = "yourPassword";

 
    public boolean testConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(URL,"sa","123456");
            System.out.println("Kết nối thành công!");
            System.out.println(conn);
            return true; // Kết nối thành công
        } catch (Exception e) {
            System.out.println("Kết nối thất bại: " + e.getMessage());
            return false; // Kết nối thất bại
        }
    }
}
