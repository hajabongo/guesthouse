package guesthouse.domain.repository.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayDeque;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import guesthouse.domain.Client;
import guesthouse.domain.Reservation;
import guesthouse.domain.repository.ReservationRepository;
import guesthouse.exeption.ReservationStartStopError;
import guesthouse.service.ClientService;
import guesthouse.service.ReservationService;

@Repository
public class ReservationRepositoryImpl implements ReservationRepository {

	private static final Logger logger = LoggerFactory.getLogger(ClientRepositoryImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private ClientService clientService;
	@Autowired
	private ReservationService reservationService;

	@SuppressWarnings("unchecked")
	public List<Reservation> getAllReservations() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Reservation> reservationList = session.createQuery("from Reservation").list();
		return reservationList;
	}

	// lista rezerwacji w przedziale czasowym
	@SuppressWarnings("unchecked")
	public List<Reservation> getAllFilterReservations(String dataStart, String dataStop) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Reservation> reservationList = session.createQuery("from Reservation where '" + dataStart
				+ "' BETWEEN data_start AND data_stop OR '" + dataStop + "' BETWEEN data_start AND data_stop OR "
				+ "data_start BETWEEN '" + dataStart + "' AND '" + dataStop + "'").list();
		return reservationList;
	}

	@SuppressWarnings("unchecked")
	public Reservation getReservationById(String id) {
		Reservation findReservation = new Reservation();
		int idReservation = Integer.valueOf(id);
		Session session = this.sessionFactory.getCurrentSession();
		List<Reservation> reservationList = session.createQuery("from Reservation").list();
		for (Reservation r : reservationList) {
			if (r.getId() == idReservation) {
				findReservation = r;
				break;
			}
		}
		return findReservation;
	}

	@SuppressWarnings("unchecked")
	public void addReservation(Reservation newReservation) {
		newReservation.setConfirm("false");
		Session session = this.sessionFactory.getCurrentSession();
		List<Reservation> list = reservationService.getAllFilterReservations(newReservation.getDataStart(),
				newReservation.getDataStop());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate dateTimeStart = LocalDate.parse(newReservation.getDataStart(), formatter);
		LocalDate dateTimeStop = LocalDate.parse(newReservation.getDataStop(), formatter);
		for (Reservation r : list) {
			if (r.getIdRoom() == newReservation.getIdRoom() || dateTimeStart.isAfter(dateTimeStop)) {
				throw new ReservationStartStopError(newReservation.getIdRoom(), newReservation.getDataStart(),
						newReservation.getDataStop());
			} else {
				session.save(newReservation);
			}
		}
	}

	public List<Reservation> getReservationsByClientId(Client client) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Reservation> getReservations = session.createQuery("from Reservation where id_client = " + client.getId())
				.list();
		return getReservations;
	}

	@SuppressWarnings("unchecked")
	public ArrayDeque<Reservation> getAllReservationsSortByDate() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Reservation> reservationList = session.createQuery("from Reservation").list();

		ArrayDeque<Reservation> quene = new ArrayDeque<Reservation>();
		for (Reservation i : reservationList) {
			quene.addFirst(i);
		}
		return quene;
	}

	public void confirmReservation(Reservation reservation) {
		Session session = this.sessionFactory.getCurrentSession();
		reservation.setConfirm("true");
		session.update(reservation);
	}

	public void breakReservation(Reservation reservation) {
		Session session = this.sessionFactory.getCurrentSession();
		reservation.setConfirm("break");
		session.update(reservation);
	}

	public ArrayDeque<Reservation> getConfirmReservations() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Reservation> getReservations = session.createQuery("from Reservation where confirm = 'true' ").list();
		ArrayDeque<Reservation> quene = new ArrayDeque<Reservation>();
		for (Reservation i : getReservations) {
			quene.addFirst(i);
		}
		return quene;
	}

	public ArrayDeque<Reservation> getBreakReservations() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Reservation> getReservations = session.createQuery("from Reservation where confirm = 'break' ").list();
		ArrayDeque<Reservation> quene = new ArrayDeque<Reservation>();
		for (Reservation i : getReservations) {
			quene.addFirst(i);
		}
		return quene;
	}

	public ArrayDeque<Reservation> getWaitingReservations() {
		Session session = this.sessionFactory.getCurrentSession();
		ArrayDeque<Reservation> quene = new ArrayDeque<Reservation>();
		List<Reservation> getReservations = session.createQuery("from Reservation where confirm = 'false' ").list();
		for (Reservation i : getReservations) {
			quene.addFirst(i);
		}
		return quene;
	}

	public void deleteReservation(Reservation reservation) {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(reservation);
	}

	public void deleteReservationsByClientId(String clientId) {
		int id = Integer.valueOf(clientId);
		for (Reservation r : reservationService.getReservationsByClientId(clientService.findClientById(id))) {
			reservationService.deleteReservation(r);
		}
	}
}
