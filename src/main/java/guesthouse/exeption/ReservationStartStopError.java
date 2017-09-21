package guesthouse.exeption;

public class ReservationStartStopError extends RuntimeException {

	private static final long serialVersionUID = -5571760528073141619L;
	private int idRoom;
	private String dataStart;
	private String dataStop;
	
	public ReservationStartStopError(int idRoom, String dataStart, String dataStop) {
		this.idRoom = idRoom;
		this.dataStart = dataStart;
		this.dataStop = dataStop;
	}
	
	public int getIdRoom() {
		return idRoom;
	}
	public String getdataStart() {
		return dataStart;
	}
	public String getdataStop() {
		return dataStop;
	}
}
