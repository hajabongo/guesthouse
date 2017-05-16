package guesthouse.domain.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.fasterxml.classmate.AnnotationConfiguration;

import guesthouse.domain.Client;
import guesthouse.domain.repository.ClientRepository;


@Repository
public class ClientRepositoryImpl implements ClientRepository {

	private SessionFactory sessionFactory;
	Configuration conf = new Configuration();
	
	public void add(Client client) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(client);
	}
	
	public Client getClientById(int id) {
		try {
			conf.configure("hibernate.cfg.xml");
		}catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
		
		Session session = this.sessionFactory.getCurrentSession();		
		Client client = (Client) session.load(Client.class, new Integer(id));
		return client;
	}
	
	@SuppressWarnings("unchecked")
	public List<Client> getAllEmployees() {

		return sessionFactory.getCurrentSession().createQuery("from Client")
				.list();
	}
	
	

	public List<Client> list() {
		Session session = this.sessionFactory.openSession();
		List<Client> clientList = session.createQuery("from Client").list();
		session.close();
		return clientList;
	}

	
	
	
	
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
