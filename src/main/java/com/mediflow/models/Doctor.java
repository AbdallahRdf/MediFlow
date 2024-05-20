package com.mediflow.models;

import com.mediflow.enums.DoctorSpecialty;
import jakarta.persistence.*;

@Entity
@Table(name = "doctors")
public class Doctor extends Person{

    // attributes
    @Enumerated(EnumType.STRING)
    private DoctorSpecialty speciality;

    @Column(name = "registration_num")
    private int registrationNum;

    // constructor
    public Doctor(){}

    public Doctor(int id, String cin, String firstName, String lastName, String email, String phone, DoctorSpecialty speciality, int registrationNum) {
        super(id, cin, firstName, lastName, email, phone);
        this.speciality = speciality;
        this.registrationNum = registrationNum;
    }

    public Doctor(String cin, String firstName, String lastName, String email, String phone, DoctorSpecialty speciality, int registrationNum) {
        super(cin, firstName, lastName, email, phone);
        this.speciality = speciality;
        this.registrationNum = registrationNum;
    }

    // getters
    public DoctorSpecialty getSpeciality() { return this.speciality; }
    public int getRegistrationNum() { return this.registrationNum; }

    // setters
    public void setSpeciality(DoctorSpecialty speciality) { this.speciality = speciality; }
    public void setRegistrationNum(int registrationNum) { this.registrationNum = registrationNum; }
}
