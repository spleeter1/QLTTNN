/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.dao;

import com.mywebapp.model.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author NAMPC
 */
public class MemberDAO extends  DAO{
    public MemberDAO(){
        super();
    }
    
    public boolean checkLogin(Member tv){
        boolean kq = false;
        if(tv.getUsername().contains("true") || tv.getUsername().contains("=") ||
           tv.getPassword().contains("true") || tv.getPassword().contains("=")) {
            return false;
        }
        
        String sql = "SELECT * FROM Members WHERE username = ? AND password = ?";
        
        try (Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1, tv.getUsername()); 
            ps.setString(2, tv.getPassword()); 

            ResultSet rs = ps.executeQuery();
            System.out.println(rs);
            if (rs.next()) {
                kq = true;
            }
        } catch (Exception e) {
        }
        return  kq;
    }
}
