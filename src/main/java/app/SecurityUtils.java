package app;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.servlet.http.HttpSession;


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
	
	public static String getSalt() {
		String result = "";
		SecureRandom rd = new SecureRandom();
		byte[] salt = new byte[16];
		rd.nextBytes(salt);
		
		result = Base64.getEncoder().encodeToString(salt);
		return result;
	}
	
	public static boolean isPasswordOk(String storedHash, String password, String storedSalt) {
		if (storedHash.equals(getPasswordHashed(password, storedSalt))) {
			return true;
		} return false;
	}
	
	public static boolean isUserLogged(HttpSession session) {
		if (session != null && session.getAttribute("LoggedUser") != null) {
			return true;
		}
		return false;
	}
}
