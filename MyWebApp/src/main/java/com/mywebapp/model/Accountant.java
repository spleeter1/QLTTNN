package com.mywebapp.model;


import com.mywebapp.model.Member;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author NAMPC
 */
public class Accountant extends Member {

    public Accountant() {
        super();
    }

    private String accountantId;

    public Accountant(int id, String username, String password, String hoTen, String email,
            String sdt, String noiSinh, String role, String dob, String accountantId) {
        super(id, username, password, hoTen, email, sdt, noiSinh, role, dob);
        this.accountantId = accountantId;
    }

    public String getAccountantId() {
        return accountantId;
    }

    public void setAccountantId(String accountantId) {
        this.accountantId = accountantId;
    }

    @Override
    public String toString() {
        return "Accountant{" + "id=" + getId()
                + ", username='" + getUsername() + '\''
                + ", hoTen='" + getHoTen() + '\''
                + ", email='" + getEmail() + '\''
                + ", sdt='" + getSdt() + '\''
                + ", noiSinh='" + getNoiSinh() + '\''
                + ", role='" + getRole() + '\''
                + ", dob='" + getDob() + '\''
                + ", accountantId='" + accountantId + '\''
                + '}';
    }

}
