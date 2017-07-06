package guesthouse.service;

import java.util.List;

import guesthouse.domain.Client;

public interface ClientService {
	
	List<Client> getAllClients();
	void addClient(Client newClient);
	Client findClientByLogin(String login);
	Client findClientById(int id);

}
