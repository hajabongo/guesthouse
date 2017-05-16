package guesthouse.domain.repository;

import java.util.List;

import guesthouse.domain.Client;

public interface ClientRepository {

	void add(Client client);
	List<Client> list();
	Client getClientById(int id);
	List<Client> getAllEmployees();
	
}
