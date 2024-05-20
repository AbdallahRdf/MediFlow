package com.mediflow.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "patients")
public class Patient extends Person{

    public Patient() {
        super();
    }

    public Patient(int id, String cin, String firstName, String lastName, String email, String phone){
        super(id, cin, firstName, lastName, email, phone);
    }

    public Patient(String cin, String firstName, String lastName, String email, String phone){
        super(cin, firstName, lastName, email, phone);
    }
}
