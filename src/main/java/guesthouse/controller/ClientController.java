package guesthouse.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import guesthouse.domain.Client;
import guesthouse.service.ClientService;

@Controller
public class ClientController {

	@Autowired
	private ClientService clientService;
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String form(Model model) {
		Client newClient = new Client();
		model.addAttribute("newClient", newClient);
		return "addClient";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addClient(@ModelAttribute("newClient") Client newClient) {
		clientService.addClient(newClient);
		return "redirect:/";
	}
	
	@RequestMapping(value="/client")
	public String client() {
		return "client";	
	}
	
	
	
	//do podgl¹du
	@RequestMapping(value="/clients", method = RequestMethod.GET)
	public String getAllClients(Model model) {
		model.addAttribute("clients", clientService.getAllClients());
		return "clients";
	}
}
