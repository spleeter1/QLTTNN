/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.model;

/**
 *
 * @author NAMPC
 */
public class Subject {
    private int id;
    private String maMon;
    private String tenMon;
    private long gia;
    private String moTa;

    public Subject() {
    }

    public Subject(int id, String maMon, String tenMon, long gia, String moTa) {
        this.id = id;
        this.maMon = maMon;
        this.tenMon = tenMon;
        this.gia = gia;
        this.moTa = moTa;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaMon() {
        return maMon;
    }

    public void setMaMon(String maMon) {
        this.maMon = maMon;
    }

    public String getTenMon() {
        return tenMon;
    }

    public void setTenMon(String tenMon) {
        this.tenMon = tenMon;
    }

    public long getGia() {
        return gia;
    }

    public void setGia(long gia) {
        this.gia = gia;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }
    
    @Override
    public String toString(){
        return "Subject{"+
                "id=" +id+
                ", maMon= " + maMon +
                ", tenMon= " + tenMon +
                ", gia= " + gia +
                ", moTa= " + moTa +
                "}\n";
    }
}
