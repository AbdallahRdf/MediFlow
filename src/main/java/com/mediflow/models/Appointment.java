package com.mediflow.models;

import com.mediflow.enums.AppointmentStatus;
import com.mediflow.enums.Room;
import com.mediflow.utils.Hibernate;
import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.sql.*;
import java.util.Date;

@Entity
@Table(name = "appointments")
public class Appointment {

    // attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne
    private Patient patient;

    @OneToOne
    private Doctor doctor;

    @Column(name = "appointment_date")
    @Temporal(TemporalType.DATE)
    private Date date;

    @Column(name = "appointment_time")
    @Temporal(TemporalType.TIME)
    private Time time;

    @Column(name = "appointment_status")
    @Enumerated(EnumType.STRING)
    private AppointmentStatus appointmentStatus;

    @Column(name = "appointment_room")
    @Enumerated(EnumType.STRING)
    private Room room;

    // constructor
    public Appointment(){}

    public Appointment(int id, Patient patient, Doctor doctor, Date date, Time time, AppointmentStatus appointmentStatus, Room room) {
        this.id = id;
        this.patient = patient;
        this.doctor = doctor;
        this.date = date;
        this.time = time;
        this.appointmentStatus = appointmentStatus;
        this.room = room;
    }

    public Appointment(Patient patient, Doctor doctor, Date date, Time time, AppointmentStatus appointmentStatus, Room room) {
        this.patient = patient;
        this.doctor = doctor;
        this.date = date;
        this.time = time;
        this.appointmentStatus = appointmentStatus;
        this.room = room;
    }

    // getters
    public int getId() { return id; }
    public Patient getPatient() { return patient; }
    public Doctor getDoctor() { return doctor; }
    public Date getDate() { return date; }
    public Time getTime() { return time; }
    public Room getRoom() { return room; }
    public AppointmentStatus getAppointmentStatus() { return appointmentStatus; }

    public static long getCountBy(AppointmentStatus status) {
        String hql = "SELECT COUNT(*) FROM Appointment WHERE appointmentStatus = :appStatus";
        Session session = Hibernate.getSessionFactory().openSession();
        Transaction tx = null;
        long count = 0;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery(hql, Appointment.class);
            query.setParameter("appStatus", status);
            count =(Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return count;
    }
}
