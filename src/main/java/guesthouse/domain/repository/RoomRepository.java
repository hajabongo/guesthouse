package guesthouse.domain.repository;

import java.util.List;
import guesthouse.domain.Room;

public interface RoomRepository {

	List <Room> getAllRooms();
	Room getRoomById(String roomId);
}
