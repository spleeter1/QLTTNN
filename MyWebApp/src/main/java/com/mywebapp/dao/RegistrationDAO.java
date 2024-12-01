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

    public boolean updateRegistrationSC(Registration registration) {
        String selectSQL = "SELECT siSoThuc, siSoMax FROM LopHocPhan WITH (UPDLOCK,ROWLOCK) WHERE maLHP = ? ";
        String updateSQL = "UPDATE LopHocPhan SET siSoThuc = siSoThuc + 1 WHERE maLHP = ? AND siSoThuc < siSoMax";
        String insertSQL = "INSERT INTO DangKyHoc (studentID, lopHocPhanMa) VALUES (?, ?)";

        Connection conn = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            // 1. Kiểm tra và khóa bản ghi LopHocPhan
            try (PreparedStatement psSelect = conn.prepareStatement(selectSQL)) {
                psSelect.setString(1, registration.getLhp().getMaLHP());
                ResultSet rs = psSelect.executeQuery();

                if (rs.next()) {
                    int siSoThuc = rs.getInt("siSoThuc");
                    int siSoMax = rs.getInt("siSoMax");

                    if (siSoThuc >= siSoMax) {
                        System.out.println("Lớp học phần đã đầy, không thể đăng ký.");
                        return false;
                    }
                } else {
                    System.out.println("Không tìm thấy lớp học phần.");
                    return false;
                }
            }

            // 2. Cập nhật siSoThuc trong bảng LopHocPhan
            try (PreparedStatement psUpdate = conn.prepareStatement(updateSQL)) {
                psUpdate.setString(1, registration.getLhp().getMaLHP());
                int updatedRows = psUpdate.executeUpdate();

                if (updatedRows == 0) {
                    System.out.println("Không thể cập nhật sĩ số, có thể lớp học phần đã đầy.");
                    return false;
                }
            }

            // 3. Thêm bản ghi vào bảng Registration
            try (PreparedStatement psInsert = conn.prepareStatement(insertSQL)) {
                psInsert.setString(1, registration.getHocVien().getStudentId());
                psInsert.setString(2, registration.getLhp().getMaLHP());
                psInsert.executeUpdate();
            }

            conn.commit();
            System.out.println("Đăng ký thành công.");
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                    System.err.println("Đã rollback do lỗi: " + e.getMessage());
                } catch (SQLException rollbackEx) {
                    System.err.println("Lỗi khi rollback: " + rollbackEx.getMessage());
                }
            }
            return false;

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("Kết nối đã được đóng.");
                } catch (SQLException closeEx) {
                    System.err.println("Lỗi khi đóng kết nối: " + closeEx.getMessage());
                }
            }
        }
    }

    public boolean deleteRegistration(String studentId, String maLHP) {
        String deleteSQL = "DELETE FROM DangKyHoc WHERE studentID = ? AND lopHocPhanMa = ?";
        String updateSQL = "UPDATE LopHocPhan SET siSoThuc = siSoThuc - 1 WHERE maLHP = ? AND siSoThuc > 0";

        Connection conn = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            // 1. Xóa đăng ký trong bảng DangKyHoc
            try (PreparedStatement psDelete = conn.prepareStatement(deleteSQL)) {
                psDelete.setString(1, studentId);
                psDelete.setString(2, maLHP);

                int deletedRows = psDelete.executeUpdate();
                if (deletedRows == 0) {
                    System.out.println("Không tìm thấy đăng ký cần xóa.");
                    return false;
                }
            }

            // 2. Cập nhật sĩ số thực tế của lớp học phần
            try (PreparedStatement psUpdate = conn.prepareStatement(updateSQL)) {
                psUpdate.setString(1, maLHP);
                int updatedRows = psUpdate.executeUpdate();

                if (updatedRows == 0) {
                    System.out.println("Không thể giảm sĩ số thực tế, có thể sĩ số đã bằng 0.");
                    return false;
                }
            }

            conn.commit();
            System.out.println("Hủy đăng ký thành công và cập nhật sĩ số.");
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                    System.err.println("Đã rollback do lỗi: " + e.getMessage());
                } catch (SQLException rollbackEx) {
                    System.err.println("Lỗi khi rollback: " + rollbackEx.getMessage());
                }
            }
            return false;

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("Kết nối đã được đóng.");
                } catch (SQLException closeEx) {
                    System.err.println("Lỗi khi đóng kết nối: " + closeEx.getMessage());
                }
            }
        }
    }

    public List<Registration> getStudentPaymentInfo(int studentId) {
        List<Registration> registrationList = new ArrayList<>();
        String query = """
            SELECT 
                dkh.id ,
                dkh.studentID,
                lhp.maLHP,
                lhp.tenLHP,
                mh.ten ,
                mh.gia ,
                dkh.mienGiam, ,
                dkh.phaiTra 
            FROM 
                DangKyHoc dkh
            JOIN 
                LopHocPhan lhp ON dkh.lopHocPhanMa = lhp.maLHP
            JOIN 
                MonHoc mh ON lhp.monHocMa = mh.maMon
            WHERE 
                dkh.studentID = ?;
        """;

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // Khởi tạo các đối tượng cần thiết
                    Student student = new Student();
                    student.setStudentId(rs.getString("studentID"));

                    SubjectClass subjectClass = new SubjectClass();
                    subjectClass.setMaLHP(rs.getString("maLHP"));
                    subjectClass.setTenLHP(rs.getString("tenLHP"));

                    Registration registration = new Registration();
                    registration.setId(rs.getInt("id"));
                    registration.setHocVien(student);
                    registration.setLhp(subjectClass);
                    registration.setDiscount(rs.getLong("mienGiam"));
                    registration.setPrice(rs.getLong("phaiTra"));

                    registrationList.add(registration);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return registrationList;
    }
}
