package guesthouse.service;

import java.util.ArrayDeque;
import java.util.List;

import guesthouse.domain.Client;
import guesthouse.domain.Reservation;

public interface ReservationService {

	List<Reservation> getAllReservations();
	void addReservation(Reservation newReservation);
	List<Reservation> getAllFilterReservations(String dataStart, String dataStop);
	List<Reservation> getReservationsByClientId(Client client);
	ArrayDeque<Reservation> getAllReservationsSortByDate();
	Reservation getReservationById(String id);
	void confirmReservation(Reservation reservation);
	void breakReservation(Reservation reservation);
	ArrayDeque<Reservation> getConfirmReservations();
	ArrayDeque<Reservation> getBreakReservations();
	ArrayDeque<Reservation> getWaitingReservations();
	void deleteReservation(Reservation reservation);
	void deleteReservationsByClientId(String clientId);

}
