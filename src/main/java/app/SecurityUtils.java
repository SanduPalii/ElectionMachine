package app;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;


public class SecurityUtils {
	
	public static String getPasswordHashed(String password, String salt) {
		String result = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
			byte[] saltBytes = Base64.getDecoder().decode(salt);
			md.update(saltBytes);
			byte[] bytes = md.digest(password.getBytes());
			
			result = Base64.getEncoder().encodeToString(bytes);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
}
