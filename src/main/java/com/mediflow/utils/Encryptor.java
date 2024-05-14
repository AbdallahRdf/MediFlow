package com.mediflow.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Encryptor {
    public static String encryptPassword(String password) {
        String hashedPassword = null;
        try {
            // Create a MessageDigest instance for SHA-256 hashing
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // Apply SHA-256 hashing to the password bytes
            byte[] hashBytes = digest.digest(password.getBytes());

            // Encode the hashed bytes as a Base64 string
            hashedPassword = Base64.getEncoder().encodeToString(hashBytes);

        } catch (NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        return hashedPassword;
    }
}
