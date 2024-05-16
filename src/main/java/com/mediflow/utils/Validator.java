package com.mediflow.utils;

import com.mediflow.enums.AppointmentStatus;
import com.mediflow.enums.DoctorSpecialty;
import com.mediflow.enums.Room;

public class Validator {
    public static boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

    // Check if the CIN (Civic Identification Number) is valid
    public static boolean isCINValid(String cin) {
        // CIN should start with one or two characters followed by 6 digits
        return cin.matches("[A-Za-z]{1,2}\\d{6}");
    }

    // Check if the email is valid
    public static boolean isEmailValid(String email) {
        // Use a simple regex for basic email validation
        return email.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}");
    }

    // Check if the phone number is valid
    public static boolean isPhoneNumberValid(String phoneNumber) {
        // Use a simple regex for basic phone number validation
        return phoneNumber.matches("\\d{10}");
    }

    // Check if the name is valid
    public static boolean isNameValid(String name) {
        // Allow letters, spaces, and hyphens
        return name.matches("[A-Za-z\\s-]+");
    }

    public static boolean isPersonInfoValid(String cin, String firstName, String lastName, String email, String phone){
        return Validator.isCINValid(cin.trim()) && Validator.isNameValid(firstName.trim()) && Validator.isNameValid(lastName.trim()) && Validator.isEmailValid(email.trim()) && Validator.isPhoneNumberValid(phone.trim());
    }

    public static boolean isNumberValid(String num){
        return num.matches("^[0-9]+$");
    }

    public static boolean isDoctorInfoValid(String cin, String firstName, String lastName, String email, String phone, String speciality, String registration_num){
        try {
            DoctorSpecialty.valueOf(speciality);
        } catch (IllegalArgumentException e){
            return false;
        }
        return isPersonInfoValid(cin, firstName, lastName, email, phone) && isNumberValid(registration_num);
    }

    public static boolean isAppointmentValid(String patientID, String doctorID, String room){
        try {
            Room.valueOf(room);
        } catch (IllegalArgumentException e){
            return false;
        }
        return isNumberValid(patientID) && isNumberValid(doctorID);
    }
}
