package guesthouse.domain.repository;

import java.util.List;

import guesthouse.domain.Client;

public interface ClientRepository {

	List<Client> getAllClients();
	void addClient(Client newClient);
	Client findClientByLogin(String login);
	Client findClientById(int id);
	
}
