package guesthouse.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "client")
public class Client {

	private static long idClient;

	@Id
	@Column(name = "id_client")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	@NotEmpty(message = "{Client.name.NotNull.validation}")
	private String name;

	@Column(name = "surname")
	@NotEmpty(message = "{Client.surname.NotNull.validation}")
	private String surname;

	@Column(name = "country")
	@NotEmpty(message = "{Client.country.NotNull.validation}")
	private String country;

	@Column(name = "phone_number")
	@Size(min = 9, max = 9, message = "{Client.phoneNumber.Size.validation}")
	private String phoneNumber;

	@Column(name = "email_adress")
	@Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "{Client.emailAdress.Regexp.validation}")
	private String emailAdress;

	@Column(name = "client_login")
	@NotEmpty(message = "{Client.login.NotNull.validation}")
	private String clientLogin;

	@Column(name = "client_password")
	@NotEmpty(message = "{Client.password.NotNull.validation}")
	private String clientPassword;


	public Client() {
		super();
		nextID();
	}

	public long nextID() {
		return ++idClient;
	}

	// ------------------------------

	public static long getIdClient() {
		return idClient;
	}

	public static void setIdClient(long idClient) {
		Client.idClient = idClient;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmailAdress() {
		return emailAdress;
	}

	public void setEmailAdress(String emailAdress) {
		this.emailAdress = emailAdress;
	}

	public String getClientLogin() {
		return clientLogin;
	}

	public void setClientLogin(String clientLogin) {
		this.clientLogin = clientLogin;
	}

	public String getClientPassword() {
		return clientPassword;
	}

	public void setClientPassword(String clientPassword) {
		this.clientPassword = clientPassword;
	}
}
