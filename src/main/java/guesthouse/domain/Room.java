package guesthouse.domain;

/*
 * Obiekt domenowy reprezentuj¹cy pokój
 * nr pokoju, opis, cena, stan,
 */
public class Room {
	
	private String roomId; //nr pokoju
	private String description; //opis
	private double price; //cena
	private boolean free = true; //stan, czy pokój jest wolny lub zarezerwowany
	private int storey; //pietro
	
	public Room() {
		super();
	}
	
	public Room(String roomId, double price, int storey) {
		this.roomId = roomId;
		this.description = description;
		this.price = price;
		this.storey = storey;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Room other = (Room) obj;
		if (roomId == null) {
			if (other.roomId != null)
				return false;
		} else if (!roomId.equals(other.roomId))
			return false;
		return true;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((roomId == null) ? 0 : roomId.hashCode());
		return result;
	}

	//gettery i settery
	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isFree() {
		return free;
	}

	public void setFree(boolean free) {
		this.free = free;
	}

	public int getStorey() {
		return storey;
	}

	public void setStorey(int storey) {
		this.storey = storey;
	}
}
