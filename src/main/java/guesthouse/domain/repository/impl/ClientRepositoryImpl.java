package guesthouse.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


import guesthouse.domain.Client;
import guesthouse.domain.repository.ClientRepository;


@Repository
public class ClientRepositoryImpl implements ClientRepository {

	private static final Logger logger = LoggerFactory.getLogger(ClientRepositoryImpl.class);

	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Client> getAllClients() {

		Session session = this.sessionFactory.getCurrentSession();
		List<Client> clientList = session.createQuery("from client").list();
		return clientList;
	}
	

	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
