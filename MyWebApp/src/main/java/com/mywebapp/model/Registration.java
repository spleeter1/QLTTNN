/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.model;

/**
 *
 * @author NAMPC
 */
public class Registration {

    private int id;
    private Student hocVien;
    private SubjectClass lhp;

    public Registration() {
    }

    public Registration(int id, Student hocVien, SubjectClass lhp) {
        this.id = id;
        this.hocVien = hocVien;
        this.lhp = lhp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getHocVien() {
        return hocVien;
    }

    public void setHocVien(Student hocVien) {
        this.hocVien = hocVien;
    }

    public SubjectClass getLhp() {
        return lhp;
    }

    public void setLhp(SubjectClass lhp) {
        this.lhp = lhp;
    }

    @Override
    public String toString() {
        return "Registration{"
                + "id=" + id
                + ", hocVien=" +  hocVien.getStudentId()
                + ", lhp=" + lhp.getMaLHP()
                + "}\n";
    }
}
