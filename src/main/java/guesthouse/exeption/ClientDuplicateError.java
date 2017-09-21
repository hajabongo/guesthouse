package guesthouse.exeption;

public class ClientDuplicateError extends RuntimeException {

	private static final long serialVersionUID = -3880077456246945835L;
	private String login;
	
	public ClientDuplicateError(String login) {
		this.login = login;
	}
	
	public String getClientLogin() {
		return login;
	}
}
