/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.model;

/**
 *
 * @author NAMPC
 */
public class Room {

    private int id;
    private String ten;
    private int sucChua;
    private String moTa;

    public Room() {
    }

    public Room(int id, String ten, int sucChua, String moTa) {
        this.id = id;
        this.ten = ten;
        this.sucChua = sucChua;
        this.moTa = moTa;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public int getSucChua() {
        return sucChua;
    }

    public void setSucChua(int sucChua) {
        this.sucChua = sucChua;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    @Override
    public String toString() {
        return "Room{"
                + "id=" + id
                + ", ten='" + ten + '\''
                + ", sucChua=" + sucChua
                + ", moTa='" + moTa + '\''
                + '}';
    }
}
