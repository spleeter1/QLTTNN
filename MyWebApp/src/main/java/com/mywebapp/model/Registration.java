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
    private long discount;
    private long price;
    public Registration() {
    }

    public Registration(int id, Student hocVien, SubjectClass lhp, long discount,long price) {
        this.id = id;
        this.hocVien = hocVien;
        this.lhp = lhp;
        this.discount = discount;
        this.price = price;
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

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public long getDiscount() {
        return discount;
    }

    public void setDiscount(long discount) {
        this.discount = discount;
    }
    
    
    @Override
    public String toString() {
        return "Registration{"
                + "id=" + id
                + ", hocVien=" +  hocVien.getStudentId()
                + ", lhp=" + lhp.getMaLHP()
                + ", giam=" + discount
                + ", phaiTra=" + price
                + "}\n";
    }
}
