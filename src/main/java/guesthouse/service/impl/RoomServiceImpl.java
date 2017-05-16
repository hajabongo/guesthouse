package guesthouse.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import guesthouse.domain.Room;
import guesthouse.domain.repository.RoomRepository;
import guesthouse.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomRepository roomRepository;

	public List <Room> getAllRooms() {
		return roomRepository.getAllRooms();
	}

	public Room getRoomById(String roomId) {
		return roomRepository.getRoomById(roomId);
	}
	
	

}
