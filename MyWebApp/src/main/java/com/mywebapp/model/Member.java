/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebapp.model;

/**
 *
 * @author NAMPC
 */
public class Member {
    private int id;          
    private String username; 
    private String password; 
    private String hoTen;     
    private String email;     
    private String sdt;
    private String noiSinh;   
    private String role;     
    private String dob;    

    public Member() {
    }

    public Member(int id, String username, String password, String hoTen, String email, String sdt, String noiSinh, String role, String dob) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.hoTen = hoTen;
        this.email = email;
        this.sdt = sdt;
        this.noiSinh = noiSinh;
        this.role = role;
        this.dob = dob;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getNoiSinh() {
        return noiSinh;
    }

    public void setNoiSinh(String noiSinh) {
        this.noiSinh = noiSinh;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
    
    
}
