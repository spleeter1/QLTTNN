/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.model;

/**
 *
 * @author NAMPC
 */
public class Teacher extends  Member{
      public Teacher() {
        super();
    }

    public Teacher(int id, String username, String password, String hoTen, String email,
            String sdt, String noiSinh, String role, String dob, String teacherId) {
        super(id, username, password, hoTen, email, sdt, noiSinh, role, dob);
        this.teacherId = teacherId;
    }
    private String teacherId;

    public String getTeacherId() {
        return teacherId;
    }

    public void setStudentId(String teacherId) {
        this.teacherId = teacherId;
    }
}
