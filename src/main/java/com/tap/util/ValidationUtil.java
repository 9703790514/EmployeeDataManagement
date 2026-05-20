package com.tap.util;

import java.util.regex.Pattern;

/**
 * Utility class for input validation
 */
public class ValidationUtil {
    
    // Email regex pattern
    private static final Pattern EMAIL_PATTERN = 
        Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
    
    // Phone regex pattern (10 digits)
    private static final Pattern PHONE_PATTERN = 
        Pattern.compile("^[0-9]{10}$");
    
    // Aadhar regex pattern (12 digits)
    private static final Pattern AADHAR_PATTERN = 
        Pattern.compile("^[0-9]{12}$");
    
    // Employee ID pattern
    private static final Pattern EMPLOYEE_ID_PATTERN = 
        Pattern.compile("^[A-Z0-9]{3,20}$");
    
    /**
     * Validate email format
     */
    public static boolean isValidEmail(String email) {
        return email != null && EMAIL_PATTERN.matcher(email).matches();
    }
    
    /**
     * Validate phone number (10 digits)
     */
    public static boolean isValidPhone(String phone) {
        return phone != null && PHONE_PATTERN.matcher(phone).matches();
    }
    
    /**
     * Validate Aadhar number (12 digits)
     */
    public static boolean isValidAadhar(String aadhar) {
        return aadhar != null && AADHAR_PATTERN.matcher(aadhar).matches();
    }
    
    /**
     * Validate employee ID
     */
    public static boolean isValidEmployeeId(String employeeId) {
        return employeeId != null && EMPLOYEE_ID_PATTERN.matcher(employeeId).matches();
    }
    
    /**
     * Check if string is not null or empty
     */
    public static boolean isNotEmpty(String value) {
        return value != null && !value.trim().isEmpty();
    }
    
    /**
     * Validate name (only letters and spaces)
     */
    public static boolean isValidName(String name) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        return name.matches("^[a-zA-Z\\s]{2,100}$");
    }
    
    /**
     * Validate salary (positive number)
     */
    public static boolean isValidSalary(String salary) {
        if (salary == null || salary.trim().isEmpty()) {
            return false;
        }
        try {
            double amount = Double.parseDouble(salary);
            return amount > 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }
    
    /**
     * Validate date format (basic check)
     */
    public static boolean isValidDate(String date) {
        if (date == null || date.trim().isEmpty()) {
            return false;
        }
        // Basic date pattern check (YYYY-MM-DD)
        return date.matches("^\\d{4}-\\d{2}-\\d{2}$");
    }
    
    /**
     * Sanitize input to prevent XSS
     */
    public static String sanitizeInput(String input) {
        if (input == null) {
            return null;
        }
        return input.replaceAll("<", "&lt;")
                    .replaceAll(">", "&gt;")
                    .replaceAll("\"", "&quot;")
                    .replaceAll("'", "&#x27;")
                    .replaceAll("/", "&#x2F;");
    }
}
