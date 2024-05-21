package com.mediflow.utils;

import com.mediflow.enums.AppointmentStatus;
import com.mediflow.enums.DoctorSpecialty;
import com.mediflow.enums.Room;

import java.util.HashMap;
import java.util.Map;

public class Validator {



    public static Map<String, String> validatePersonInfo(String cin, String firstName, String lastName, String email, String phone ) {
        Map<String, String> errors = new HashMap<>();

        if (!isCINValid(cin)) {
            errors.put("cin", "CIN isn't valid. It should start with one or two characters followed by 6 digits.");
        }
        if (!isNameValid(firstName)) {
            errors.put("firstName", "First name isn't valid. It should only contain letters, spaces, and hyphens.");
        }
        if (!isNameValid(lastName)) {
            errors.put("lastName", "Last name isn't valid. It should only contain letters, spaces, and hyphens.");
        }
        if (!isEmailValid(email)) {
            errors.put("email", "Email isn't valid. Please enter a valid email address.");
        }
        if (!isPhoneNumberValid(phone)) {
            errors.put("phone", "Phone number isn't valid. It should contain exactly 10 digits.");
        }

        return errors;
    }
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

    public static boolean isDateValid(String date){
        return date.matches("^\\d{4}-\\d{2}-\\d{2}$");
    }

    public static boolean isTimeValid(String time){
        return time.matches("^([01]\\d|2[0-3]):([0-5]\\d)$");
    }

    public static boolean isDoctorInfoValid(String cin, String firstName, String lastName, String email, String phone, String speciality, String registration_num){
        try {
            DoctorSpecialty.valueOf(speciality);
        } catch (IllegalArgumentException e){
            return false;
        }
        return true;
    }

    public static boolean isAppointmentValid(String patientID, String doctorID, String date, String time, String room){
        try {
            Room.valueOf(room);
        } catch (IllegalArgumentException e){
            return false;
        }
        return isNumberValid(patientID) && isTimeValid(time) && isDateValid(date) && isNumberValid(doctorID);
    }
}
