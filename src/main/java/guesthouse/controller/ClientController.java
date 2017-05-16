package guesthouse.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import guesthouse.service.ClientService;

@Controller
public class ClientController {

	@Autowired
	private ClientService clientService;
	
	@RequestMapping("/clients")
	public String getClientById(Model model) {
		model.addAttribute("clients", clientService.getAllEmployees());
		return "clients";
	}
}
