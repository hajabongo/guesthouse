package guesthouse.domain.repository.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import guesthouse.domain.Client;
import guesthouse.domain.repository.ClientRepository;
import guesthouse.exeption.ClientDuplicateError;

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
		Session session = this.sessionFactory.getCurrentSession();
		List<Client> clientList = getAllClients();
		for (Client c : clientList) {
			if (c.getClientLogin().equals(newClient.getClientLogin())) {
				throw new ClientDuplicateError(newClient.getClientLogin());
			} else {
				session.persist(newClient);
			}
		}
	}

	public Client findClientById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Client client = (Client) session.load(Client.class, new Integer(id));
		System.out.println(client.getName());
		return client;
	}

	public Client findClientByLogin(String login) {
		List<Client> clientList = getAllClients();
		Client client = new Client();
		try {
			for (Client c : clientList) {
				if (c.getClientLogin().equals(login)) {
					client = c;
					System.out.println("Witaj " + client.getName());
					return client;
				}
			}
		} catch (Exception e) {
			System.out.println("Brak loginu w bd");
		}
		return client;
	}
}
