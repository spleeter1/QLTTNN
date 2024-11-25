/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.model;

/**
 *
 * @author NAMPC
 */

public class Student extends Member {

    public Student() {
        super();
    }

    public Student(int id, String username, String password, String hoTen, String email,
            String sdt, String noiSinh, String role, String dob, String studentId) {
        super(id, username, password, hoTen, email, sdt, noiSinh, role, dob);
        this.studentId = studentId;
    }
    private String studentId;

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    @Override
public String toString() {
    return "Student{" +
           "id=" + getId() +
           ", username='" + getUsername() + '\'' +
           ", hoTen='" + getHoTen() + '\'' +
           ", email='" + getEmail() + '\'' +
           ", sdt='" + getSdt() + '\'' +
           ", noiSinh='" + getNoiSinh() + '\'' +
           ", role='" + getRole() + '\'' +
           ", dob='" + getDob() + '\'' +
           ", studentId='" + studentId + '\'' +
           '}';
}
}
