package com.mediflow.validation;

public class Validator {
    public static boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
