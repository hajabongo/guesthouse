package guesthouse.exeption;

public class ClientDuplicateError extends RuntimeException {

	private String login;
	
	public ClientDuplicateError(String login) {
		this.login = login;
	}
	
	public String getClientLogin() {
		return login;
	}
}
