package guesthouse.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="user_roles")
public class UserRole {
	
	@Id
	@Column(name = "user_login_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "client_login")
	private String clientLogin;
	
	@Column(name = "client_role")
	private String clientRole;
	
	public UserRole() {
		super();
	}

	public String getClientLogin() {
		return clientLogin;
	}

	public void setClientLogin(String clientLogin) {
		this.clientLogin = clientLogin;
	}

	public String getClientRole() {
		return clientRole;
	}

	public void setClientRole(String clientRole) {
		this.clientRole = clientRole;
	}

}
