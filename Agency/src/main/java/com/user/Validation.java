package com.user;

public class Validation {
	public static Boolean validate(String phoneNumber) {
    String regex = "(0/91)?[7-9][0-9]{9}";
    if(phoneNumber.matches(regex)) {
    	return true;
    }
    return false;
 }

}
