/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.dao;
import com.mywebapp.model.Registration;
import com.mywebapp.model.Student;
import com.mywebapp.model.SubjectClass;
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
public class RegistrationDAO extends DAO {

    public RegistrationDAO() {
        super();
    }

    public List<Registration> getRegistrationByStudentID(String stuID) {
        List<Registration> registrations = new ArrayList<>();
        String sql = "SELECT r.id, sc.monHocMa, mh.ten AS tenMonHoc, sc.maLHP, sc.tenLHP "
                + "FROM DangKyHoc AS r "
                + "JOIN Student AS s ON r.studentID = s.studentID "
                + "JOIN LopHocPhan AS sc ON r.lopHocPhanMa = sc.maLHP "
                + "JOIN MonHoc AS mh ON mh.maMon = sc.monHocMa "
                + "WHERE s.studentID = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, stuID);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SubjectClass subjectClass = new SubjectClass();
                subjectClass.setMonHocMa(rs.getString("monHocMa"));
                subjectClass.setMaLHP(rs.getString("maLHP"));
                subjectClass.setTenLHP(rs.getString("tenLHP"));
                
                Student student = new Student();
                student.setStudentId(stuID);
                
                Registration registration = new Registration();
                registration.setId(rs.getInt("id"));
                registration.setHocVien(student);
                registration.setLhp(subjectClass);

                registrations.add(registration);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return registrations;
    }
}
