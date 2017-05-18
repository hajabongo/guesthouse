package guesthouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import guesthouse.domain.Client;
import guesthouse.domain.repository.ClientRepository;
import guesthouse.service.ClientService;

@Service
public class ClientServiceImpl implements ClientService {

	@Autowired
	private ClientRepository clientRepository;
	
	public List<Client> getAllClients() {
		return clientRepository.getAllClients();
	}
}
