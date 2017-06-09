package guesthouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import guesthouse.domain.Reservation;
import guesthouse.domain.Room;
import guesthouse.domain.repository.ReservationRepository;
import guesthouse.domain.repository.RoomRepository;
import guesthouse.service.ReservationService;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationRepository reservationRepository;

	@Transactional(readOnly = false)
	public List<Reservation> getAllReservations() {
		return reservationRepository.getAllReservations();
	}

	@Transactional(readOnly = false)
	public void addReservation(Reservation newReservation) {
		reservationRepository.addReservation(newReservation);
	}

	@Transactional(readOnly = false)
	public List<Reservation> getAllFilterReservations(String dataStart, String dataStop) {
		return reservationRepository.getAllFilterReservations(dataStart, dataStop);
	}
}
