package com.mediflow.utils;

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
}
