/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.model;

/**
 *
 * @author NAMPC
 */
public class BuoiHoc {

    private int id;
    private String teacherId;
    private int kipId;
    private String phongHocTen;
    private String lopHocPhanMa;
    private String moTa;

    public BuoiHoc() {
    }

    public BuoiHoc(int id, String teacherId, int kipId, String phongHocTen, String lopHocPhanMa, String moTa) {
        this.id = id;
        this.teacherId = teacherId;
        this.kipId = kipId;
        this.phongHocTen = phongHocTen;
        this.lopHocPhanMa = lopHocPhanMa;
        this.moTa = moTa;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public int getKipId() {
        return kipId;
    }

    public void setKipId(int kipId) {
        this.kipId = kipId;
    }

    public String getPhongHocTen() {
        return phongHocTen;
    }

    public void setPhongHocTen(String phongHocTen) {
        this.phongHocTen = phongHocTen;
    }

    public String getLopHocPhanMa() {
        return lopHocPhanMa;
    }

    public void setLopHocPhanMa(String lopHocPhanMa) {
        this.lopHocPhanMa = lopHocPhanMa;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    @Override
    public String toString() {
        return "BuoiHoc{"
                + "id=" + id
                + ", teacherId='" + teacherId + '\''
                + ", kipId=" + kipId
                + ", phongHocTen='" + phongHocTen + '\''
                + ", lopHocPhanMa='" + lopHocPhanMa + '\''
                + ", moTa='" + moTa + '\''
                + "}\n";
    }
}
