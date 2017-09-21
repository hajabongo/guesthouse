package guesthouse.domain.repository;

import java.util.List;

import guesthouse.domain.Client;
import guesthouse.domain.UserRole;

public interface ClientRepository {

	List<Client> getAllClients();
	void addClient(Client newClient);
	void updateClient(Client client);
	Client findClientByLogin(String login);
	Client findClientById(int id);
	void deleteClient(Client client);
	
}
