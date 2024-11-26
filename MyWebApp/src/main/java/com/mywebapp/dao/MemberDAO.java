/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.dao;

import com.mywebapp.model.Member;
import com.mywebapp.model.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author NAMPC
 */
public class MemberDAO extends DAO {

    public MemberDAO() {
        super();
    }

    public boolean checkLogin(Member tv) {
        boolean kq = false;
        if (tv.getUsername().contains("true") || tv.getUsername().contains("=")
                || tv.getPassword().contains("true") || tv.getPassword().contains("=")) {
            System.out.println("sai kí tự");
            return false;
        }

        String sql = "SELECT * FROM Members WHERE username = ? AND password = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tv.getUsername());
            ps.setString(2, tv.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                tv.setId(rs.getInt("ID"));
                tv.setRole(rs.getString("role"));
                tv.setUsername(rs.getString("username"));
                tv.setPassword(rs.getString("password"));
                tv.setHoTen(rs.getString("hoTen"));
                tv.setDob(rs.getString("dob"));
                tv.setEmail(rs.getString("email"));
                tv.setNoiSinh(rs.getString("noiSinh"));
                tv.setSdt(rs.getString("sdt"));
                kq = true;
            }
        } catch (Exception e) {
        }
        return kq;
    }

    public String geStudentInfor(int id) {
        String sql = "SELECT * FROM Student WHERE id = ?";
        String msv = "";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                msv = rs.getString("studentID");
                System.out.println(msv);
            }
        } catch (Exception e) {

        }
        return msv;
    }

    public boolean updatePersonalInfor(int userId, Member newInfor) {
        String sql = "UPDATE Members SET hoTen = ?, email = ?, sdt = ?, dob = ?, noiSinh = ? WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newInfor.getHoTen());
            ps.setString(2, newInfor.getEmail());
            ps.setString(3, newInfor.getSdt());
            ps.setString(4, newInfor.getDob());
            ps.setString(5, newInfor.getNoiSinh());
            ps.setInt(6, userId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally{
        }
    }
}
