package guesthouse.domain.repository;

import java.util.ArrayDeque;
import java.util.List;

import org.hibernate.Session;

import guesthouse.domain.Client;
import guesthouse.domain.Reservation;


public interface ReservationRepository {
	
	List<Reservation> getAllReservations();
	void addReservation(Reservation newReservation);
	List<Reservation> getAllFilterReservations(String dataStart, String dataStop);
	Reservation getReservationById(String id);
	List<Reservation> getReservationsByClientId(Client client);
	ArrayDeque<Reservation> getAllReservationsSortByDate();
	void confirmReservation(Reservation reservation);
	void breakReservation(Reservation reservation);
	ArrayDeque<Reservation> getConfirmReservations();
	ArrayDeque<Reservation> getBreakReservations();
	ArrayDeque<Reservation> getWaitingReservations();
	void deleteReservation(Reservation reservation);
	void deleteReservationsByClientId(String clientId);

}
