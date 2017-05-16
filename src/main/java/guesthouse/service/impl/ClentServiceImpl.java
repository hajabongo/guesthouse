package guesthouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import guesthouse.domain.Client;
import guesthouse.domain.repository.ClientRepository;
import guesthouse.service.ClientService;

@Service
public class ClentServiceImpl implements ClientService {

	@Autowired
	private ClientRepository clientRepository;
	
	public Client getClientById(int id) {
		return clientRepository.getClientById(id);
	}
	public List<Client> getAllEmployees() {
		return clientRepository.getAllEmployees();
	}
}
