package guesthouse.service;

import java.util.List;
import guesthouse.domain.Room;

public interface RoomService {

	List<Room> getAllRooms();

	Room getRoomById(String roomId);

}
