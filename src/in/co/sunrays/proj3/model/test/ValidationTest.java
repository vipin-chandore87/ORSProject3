package in.co.sunrays.proj3.model.test;

import in.co.sunrays.proj3.util.DataValidator;

public class ValidationTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("In Test Null Validator "+DataValidator.isNull("12"));
		System.out.println("In Test Integer Validator "+DataValidator.isInteger("12"));
		System.out.println("In Test Email Validator "+DataValidator.isEmail("ranj@m.com"));
		System.out.println("In Test "+DataValidator.isNotNull("tt"));
		
		if (DataValidator.isNull("22") || !DataValidator.isInteger("kkkkkkkkkkkkkkkkk")) {
			System.out.println(false);
		} else {
			System.out.println(true);
		}
		
	}

}
