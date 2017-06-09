package guesthouse.domain.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import guesthouse.domain.Client;
import guesthouse.domain.repository.ClientRepository;

@Repository
public class ClientRepositoryImpl implements ClientRepository {

	private static final Logger logger = LoggerFactory.getLogger(ClientRepositoryImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Client> getAllClients() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Client> clientList = session.createQuery("from Client").list();
		return clientList;
	}
	
	public void addClient(Client newClient) {	
		
//			newClient.setName("Daniel");
//			newClient.setSurname("Rejsz");
//			newClient.setCountry("Kudowa-Zdr�j");
//			newClient.setPhoneNumber("609721828");
//			newClient.setEmailAdress("hajabongo@gmail.com");
//			newClient.setClientLogin("login");
//			newClient.setClientPassword("password");
		
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(newClient);
	}

}
