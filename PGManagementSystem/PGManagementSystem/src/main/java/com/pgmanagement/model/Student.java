package com.pgmanagement.model;

public class Student {

    private int id;
    private String name;
    private String email;
    private String mobile;
    private String guardianMobile;
    private String address;
    private String idProof;
    private String password;

    public Student() {
    }

    public Student(
            int id,
            String name,
            String email,
            String mobile,
            String guardianMobile,
            String address,
            String idProof,
            String password) {

        this.id = id;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.guardianMobile = guardianMobile;
        this.address = address;
        this.idProof = idProof;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getGuardianMobile() {
        return guardianMobile;
    }

    public void setGuardianMobile(String guardianMobile) {
        this.guardianMobile = guardianMobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIdProof() {
        return idProof;
    }

    public void setIdProof(String idProof) {
        this.idProof = idProof;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}