/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.dao;

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
public class SubjectClassDAO extends DAO {

    public SubjectClassDAO() {
        super();
    }

    public List<SubjectClass> getSubjectClasByMa(String maMon) {
        List<SubjectClass> subjectClassList = new ArrayList<>();

        String sql = "SELECT * FROM LopHocPhan WHERE monHocMa = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, maMon);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    SubjectClass subjectClass = new SubjectClass();
                    subjectClass.setId(rs.getInt("id"));
                    subjectClass.setMaLHP(rs.getString("maLHP"));
                    subjectClass.setTenLHP(rs.getString("tenLHP"));
                    subjectClass.setSiSoMax(rs.getInt("siSoMax"));
                    subjectClass.setSiSoThuc(rs.getInt("siSoThuc"));
                    subjectClass.setMonHocMa(rs.getString("monHocMa"));

                    subjectClassList.add(subjectClass);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subjectClassList;
    }
}
