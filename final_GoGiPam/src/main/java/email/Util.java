package email;

public class Util {

	public Util() {
	}

	// 문자열을 헥사코드로 변환해주는 메소드
	public static String stringToHex(String s) {
		String result = "";

		for (int i = 0; i < s.length(); i++) {
			result += String.format("%02X", (int) s.charAt(i));
		}

		return result;
	}

	// 헥사코드로 바이트배열타입으로 변환해주는 메소드
	public static byte[] hexStringToByteArray(String s) {
		int length = s.length();
		byte[] data = new byte[length / 2];
		for (int i = 0; i < length; i += 2) {
			data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4) + Character.digit(s.charAt(i + 1), 16));
		}
		return data;
	}

	
	// 암호화 작업. 링크 보내줄때 적용.
	public static String encryption(String member_id) {
		String encryptionCode = stringToHex(member_id);

		return encryptionCode;
	}

	// 복호화 작업. 새 비밀번호 설정 페이지에서 사용.
	public static String decryption(String link) {
		byte[] bytes = hexStringToByteArray(link);
		String decryptionCode = new String(bytes); // byte -> string

		return decryptionCode;
	}
	
	
}
