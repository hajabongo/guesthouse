package guesthouse.domain.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import guesthouse.domain.Reservation;
import guesthouse.domain.repository.ReservationRepository;

@Repository
public class ReservationRepositoryImpl implements ReservationRepository {
	
	private static final Logger logger = LoggerFactory.getLogger(ClientRepositoryImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	//wszystkie rezerwacje
	@SuppressWarnings("unchecked")
	public List<Reservation> getAllReservations() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Reservation> reservationList = session.createQuery("from Reservation").list();
		return reservationList;
	}

	//lista rezerwacji w przedziale czasowym
	@SuppressWarnings("unchecked")
	public List<Reservation> getAllFilterReservations(String dataStart, String dataStop) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Reservation> reservationList = session.createQuery("from Reservation where '"
				+ dataStart + "' BETWEEN data_start AND data_stop OR '"
				+ dataStop + "' BETWEEN data_start AND data_stop OR "
				+ "data_start BETWEEN '" + dataStart + "' AND '" + dataStop + "'").list();
		return reservationList;
	}
	
	public void getReservationById(String id) {
		Session session = this.sessionFactory.getCurrentSession();
	}
	
	//dodaj rezerwacje
	public void addReservation(Reservation newReservation) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(newReservation);
	}

}
