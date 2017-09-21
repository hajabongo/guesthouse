package guesthouse.service.impl;

import java.util.ArrayDeque;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import guesthouse.domain.Client;
import guesthouse.domain.Reservation;
import guesthouse.domain.Room;
import guesthouse.domain.repository.ReservationRepository;
import guesthouse.domain.repository.RoomRepository;
import guesthouse.service.ReservationService;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationRepository reservationRepository;

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
	
	@Transactional(readOnly = false)
	public List<Reservation> getReservationsByClientId(Client client) {
		return reservationRepository.getReservationsByClientId(client);
	}
	
	@Transactional(readOnly = false)
	public ArrayDeque<Reservation> getAllReservationsSortByDate() {
		return reservationRepository.getAllReservationsSortByDate();
	}
	
	@Transactional
	public Reservation getReservationById(String id) {
		return reservationRepository.getReservationById(id);
	}
	
	@Transactional(readOnly = false)
	public void confirmReservation(Reservation reservation) {
		reservationRepository.confirmReservation(reservation);
	}
	
	@Transactional(readOnly = false)
	public void breakReservation(Reservation reservation) {
		reservationRepository.breakReservation(reservation);
	}

	@Transactional
	public ArrayDeque<Reservation> getConfirmReservations() {
		return reservationRepository.getConfirmReservations();
	}

	@Transactional
	public ArrayDeque<Reservation> getBreakReservations() {
		return reservationRepository.getBreakReservations();
	}

	@Transactional
	public ArrayDeque<Reservation> getWaitingReservations() {
		return reservationRepository.getWaitingReservations();
	}
	
	@Transactional
	public void deleteReservation(Reservation reservation) {
		reservationRepository.deleteReservation(reservation);
	}
	
	@Transactional(readOnly = false)
	public void deleteReservationsByClientId(String clientId) {
		reservationRepository.deleteReservationsByClientId(clientId);
	}
}
