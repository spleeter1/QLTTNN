/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.dao;
import java.sql.Connection;
import java.sql.DriverManager;
public class DAO {
    public static Connection con;
     
    public DAO(){
        if(con == null){
            String dbUrl = "jdbc:sqlserver://localhost:1433;databaseName=model;integratedSecurity=true";
            String dbClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
 
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection (dbUrl );
                System.out.println("Kết nối thành công!");
                
                con.close();
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
}
