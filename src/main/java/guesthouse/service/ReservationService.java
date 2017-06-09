package guesthouse.service;

import java.util.List;

import guesthouse.domain.Reservation;

public interface ReservationService {

	List<Reservation> getAllReservations();
	void addReservation(Reservation newReservation);
	List<Reservation> getAllFilterReservations(String dataStart, String dataStop);

}
