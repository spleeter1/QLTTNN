/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.dao;

import com.mywebapp.model.Subject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NAMPC
 */
public class SubjectDAO extends DAO {

    public SubjectDAO() {
        super();
    }
    
    public List<Subject> getSubjects() {
        List<Subject> subjects = new ArrayList<>();
        
        String sql = "SELECT * FROM MonHoc";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String maMon = rs.getString("maMon");
                String tenMon = rs.getString("ten");
                long gia = rs.getLong("gia");
                String moTa = rs.getString("moTa");

                Subject subject = new Subject(id, maMon, tenMon, gia, moTa);
                subjects.add(subject);
            }
        } catch (Exception e) {
        }
        
        return subjects;
    }
    
    public List<Subject> findSubjects(String keyword) {
    List<Subject> subjects = new ArrayList<>();
    String sql = "SELECT * FROM MonHoc WHERE LOWER(maMon) LIKE ? OR LOWER(ten) LIKE ?";
    try (Connection conn = getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        String searchKey = "%" + keyword.toLowerCase() + "%";
        ps.setString(1, searchKey);
        ps.setString(2, searchKey);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setMaMon(rs.getString("maMon"));
                subject.setTenMon(rs.getString("ten"));
                subject.setGia(rs.getLong("gia"));
                subject.setMoTa(rs.getString("moTa"));
                subjects.add(subject);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return subjects;
    }

}
