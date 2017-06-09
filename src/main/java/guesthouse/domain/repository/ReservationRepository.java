package guesthouse.domain.repository;

import java.util.List;

import org.hibernate.Session;

import guesthouse.domain.Reservation;


public interface ReservationRepository {
	
	List<Reservation> getAllReservations();
	void addReservation(Reservation newReservation);
	List<Reservation> getAllFilterReservations(String dataStart, String dataStop);
	void getReservationById(String id);

}
