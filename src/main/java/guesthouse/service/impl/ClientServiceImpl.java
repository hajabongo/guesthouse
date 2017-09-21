package guesthouse.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import guesthouse.domain.Client;
import guesthouse.domain.repository.ClientRepository;
import guesthouse.service.ClientService;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ClientServiceImpl implements ClientService {

	@Autowired
	private ClientRepository clientRepository;
	
	@Transactional(readOnly = false)
	public List<Client> getAllClients() {
		return clientRepository.getAllClients();
	}
	
	@Transactional(readOnly = false)
	public void addClient(Client newClient) {
		clientRepository.addClient(newClient);
	}
	
	@Transactional
	public Client findClientById(int id) {
		return clientRepository.findClientById(id);
	}
	
	@Transactional
	public Client findClientByLogin(String login) {
		return clientRepository.findClientByLogin(login);
	}
	
	@Transactional(readOnly = false)
	public void updateClient(Client client) {
		clientRepository.updateClient(client);
	}

	@Transactional(readOnly = false)
	public void deleteClient(Client client) {
		clientRepository.deleteClient(client);
	}
	
}
