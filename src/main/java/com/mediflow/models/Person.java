package com.mediflow.models;

import jakarta.persistence.*;

@MappedSuperclass
public class Person {
    // attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String cin;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "email")
    private String email;
    @Column(name = "tele")
    private String phone;

    // constructor
    public Person(){}

    public Person(int id, String cin, String firstName, String lastName, String email, String phone) {
        this.id = id;
        this.cin = cin;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }

    public Person(String cin, String firstName, String lastName, String email, String phone) {
        this.cin = cin;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }

    // getters
    public int getID() { return this.id; }
    public String getCIN() { return this.cin; }
    public String getFirstName() { return this.firstName; }
    public String getLastName() { return this.lastName; }
    public String getEmail() { return this.email; }
    public String getPhone() { return this.phone; }
}
