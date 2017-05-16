package guesthouse.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import guesthouse.domain.Room;
import guesthouse.domain.repository.RoomRepository;
import guesthouse.service.ReservationService;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private RoomRepository roomRepository;

	public void processReservation(String roomId) {
		Room roomById = roomRepository.getRoomById(roomId);
		if (roomById.isFree() == false) {
			throw new IllegalArgumentException("Pokój jest ju¿ zarezerwowany");
		}
		roomById.setFree(false);
	}
}
