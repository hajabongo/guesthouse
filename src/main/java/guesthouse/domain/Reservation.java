package guesthouse.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "reservation")
public class Reservation {

	private static long idReservation;
	
	@Id
	@Column(name = "id_reservation")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	
	@Column(name = "data_reservation")
	private String dataReservation;
	
	@Column(name = "data_start")
	@Pattern(regexp = "^[0-9]{4}-[0-1][0-9]-[0-3][0-9]$", message="{Reservation.dataStart.Pattern.validation}")
	private String dataStart;

	@Column(name = "data_stop")
	@Pattern(regexp = "^[0-9]{4}-[0-1][0-9]-[0-3][0-9]$", message="{Reservation.dataStop.Pattern.validation}")
	private String dataStop;

	@Column(name = "id_room")
	private int idRoom;

	@Column(name = "id_client")
	private int idClient;
	
	@Column(name = "confirm")
	private String confirm;

	public Reservation() {
		super();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		dataReservation = date.format(new Date()); 
		nextID();
	}

	public long nextID() {
		return ++idReservation;
	}

	// -----------------------------------

	public static long getIdReservation() {
		return idReservation;
	}

	public static void setIdReservation(long idReservation) {
		Reservation.idReservation = idReservation;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDataReservation() {
		return dataReservation;
	}

	public void setDataReservation(String dataReservation) {
		this.dataReservation = dataReservation;
	}

	public String getDataStart() {
		return dataStart;
	}

	public void setDataStart(String dataStart) {
		this.dataStart = dataStart;
	}

	public String getDataStop() {
		return dataStop;
	}

	public void setDataStop(String dataStop) {
		this.dataStop = dataStop;
	}

	public int getIdRoom() {
		return idRoom;
	}

	public void setIdRoom(int idRoom) {
		this.idRoom = idRoom;
	}

	public int getIdClient() {
		return idClient;
	}

	public void setIdClient(int idClient) {
		this.idClient = idClient;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

}
