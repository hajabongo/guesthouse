package guesthouse.domain.repository.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;
import guesthouse.domain.Room;
import guesthouse.domain.repository.RoomRepository;

@Repository
public class InMemoryRoomRepository implements RoomRepository {

	private List<Room> listOfRooms = new ArrayList<Room>();

	public InMemoryRoomRepository() {

		Room A1 = new Room("1", 150.00, 0);
		A1.setDescription("Pokój czteroosobowy");

		Room A2 = new Room("2", 150.00, 0);
		A2.setDescription("Pokój czteroosobowy");

		Room A3 = new Room("3", 120.00, 0);
		A3.setDescription("Pokój trzyosobowy");

		Room B1 = new Room("4", 80.00, 1);
		B1.setDescription("Pokój dwuosobowy");

		Room B2 = new Room("5", 80.00, 1);
		B2.setDescription("Pokój dwuosobowy");

		Room B3 = new Room("6", 80.00, 1);
		B3.setDescription("Pokój dwuosobowy");

		Room B4 = new Room("7", 80.00, 1);
		B4.setDescription("Pokój dwuosobowy");

		Room B5 = new Room("8", 120.00, 1);
		B5.setDescription("Pokój trzyosobowy");

		Room B6 = new Room("9", 120.00, 1);
		B6.setDescription("Pokój trzyosobowy");

		Room B7 = new Room("10", 150.00, 1);
		B7.setDescription("Pokój czteroosobowy");

		Room B8 = new Room("11", 120.00, 1);
		B8.setDescription("Pokój trzyosobowy");

		Room B9 = new Room("12", 80.00, 1);
		B9.setDescription("Pokój dwuosobowy");

		listOfRooms.add(A1);
		listOfRooms.add(A2);
		listOfRooms.add(A3);
		listOfRooms.add(B1);
		listOfRooms.add(B2);
		listOfRooms.add(B3);
		listOfRooms.add(B4);
		listOfRooms.add(B5);
		listOfRooms.add(B6);
		listOfRooms.add(B7);
		listOfRooms.add(B8);
		listOfRooms.add(B9);
	}

	public List<Room> getAllRooms() {
		return listOfRooms;
	}

	public Room getRoomById(String roomId) {
		Room roomById = null;
		for (Room room : listOfRooms) {
			if (room != null && room.getRoomId() != null && room.getRoomId().equals(roomId)) {
				roomById = room;
				break;
			}
		}
		if (roomById == null) {
			throw new IllegalArgumentException("Brak pokoju o podanym id: " + roomId);
		}

		return roomById;
	}
}
