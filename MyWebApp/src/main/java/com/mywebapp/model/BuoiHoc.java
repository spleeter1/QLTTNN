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
    private Teacher teacher;
    private Kip kip;
    private Day day;
    private Room room;
    private String moTa;

    public BuoiHoc() {
    }

    public BuoiHoc(int id, Teacher teacher, Kip kip, Day day, Room room, String moTa) {
        this.id = id;
        this.teacher = teacher;
        this.kip = kip;
        this.day = day;
        this.room = room;
        this.moTa = moTa;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Kip getKip() {
        return kip;
    }

    public void setKip(Kip kip) {
        this.kip = kip;
    }

    public Day getDay() {
        return day;
    }

    public void setDay(Day day) {
        this.day = day;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
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
                + ", teacherId='" + teacher.getId() + '\''
                + ", kipId=" + kip.getId()
                + ", ngay=" + day.getTen() + '\''
                + ", phongHocTen='" + room.getTen() + '\''
                + ", moTa='" + moTa + '\''
                + "}\n";
    }
}
