/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.dao;

import com.mywebapp.model.BuoiHoc;
import com.mywebapp.model.Day;
import com.mywebapp.model.Kip;
import com.mywebapp.model.Room;
import com.mywebapp.model.Teacher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author NAMPC
 */
public class BuoiHocDAO extends DAO{
    public BuoiHocDAO(){
        super();
    }
    
     public List<BuoiHoc> getBuoiHocByMaLHP(String maLHP) {
        List<BuoiHoc> buoiHocs = new ArrayList<>();
        String sql = "SELECT * FROM BuoiHoc WHERE lopHocPhanMa = ?";
        
        try (Connection conn = getConnection();PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maLHP);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BuoiHoc buoiHoc = new BuoiHoc();
                buoiHoc.setId(rs.getInt("id"));
                
                Teacher teacher = new Teacher(); 
                teacher.setTeacherId(rs.getString("teacherID"));
                Kip kip = new Kip(); 
                kip.setId(rs.getInt("kipId"));
                Day day = new Day(); 
                day.setTen(rs.getString("ngayHocTen"));
                Room room = new Room();
                room.setTen(rs.getString("phongHocTen"));
                
                buoiHoc.setTeacher(teacher);
                buoiHoc.setKip(kip);
                buoiHoc.setDay(day);
                buoiHoc.setRoom(room);
                buoiHoc.setMoTa(rs.getString("moTa"));

                buoiHocs.add(buoiHoc);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return buoiHocs;
    }
}
