/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.model;

/**
 *
 * @author NAMPC
 */
public class LopHocPhan {
    private int id;
    private String maLHP;
    private String tenLHP;
    private int siSoMax;
    private int siSoThuc;
    private String monHocMa;

    public LopHocPhan() {
    }

    public LopHocPhan(int id, String maLHP, String tenLHP, int siSoMax, int siSoThuc, String monHocMa) {
        this.id = id;
        this.maLHP = maLHP;
        this.tenLHP = tenLHP;
        this.siSoMax = siSoMax;
        this.siSoThuc = siSoThuc;
        this.monHocMa = monHocMa;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaLHP() {
        return maLHP;
    }

    public void setMaLHP(String maLHP) {
        this.maLHP = maLHP;
    }

    public String getTenLHP() {
        return tenLHP;
    }

    public void setTenLHP(String tenLHP) {
        this.tenLHP = tenLHP;
    }

    public int getSiSoMax() {
        return siSoMax;
    }

    public void setSiSoMax(int siSoMax) {
        this.siSoMax = siSoMax;
    }

    public int getSiSoThuc() {
        return siSoThuc;
    }

    public void setSiSoThuc(int siSoThuc) {
        this.siSoThuc = siSoThuc;
    }

    public String getMonHocMa() {
        return monHocMa;
    }

    public void setMonHocMa(String monHocMa) {
        this.monHocMa = monHocMa;
    }
    
    @Override
    public String toString() {
        return "LopHocPhan{" +
                "id=" + id +
                ", maLHP=" + maLHP +
                ", tenLHP" + tenLHP +
                ", siSoMax=" + siSoMax +
                ", siSoThuc=" + siSoThuc +
                ", monHocId=" + monHocMa +
                '}';
    }
}
