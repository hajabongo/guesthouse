package guesthouse.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "reservation")
public class Reservation {

	private static long idReservation;

	@Id
	@Column(name = "id_reservation")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String id;

	@Column(name = "data_reservation")
	private String dataReservation;

	@Column(name = "data_start")
	private String dataStart;

	@Column(name = "data_stop")
	private String dataStop;

	@Column(name = "id_room")
	private String idRoom;

	@Column(name = "id_client")
	private String idClient;

	public Reservation() {
		super();
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
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

	public String getIdRoom() {
		return idRoom;
	}

	public void setIdRoom(String idRoom) {
		this.idRoom = idRoom;
	}

	public String getIdClient() {
		return idClient;
	}

	public void setIdClient(String idClient) {
		this.idClient = idClient;
	}

}
