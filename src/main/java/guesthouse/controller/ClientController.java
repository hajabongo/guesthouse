package guesthouse.controller;

import static org.hamcrest.CoreMatchers.describedAs;

import java.io.IOException;
import java.util.List;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import guesthouse.domain.Client;
import guesthouse.domain.UserRole;
import guesthouse.exeption.ClientDuplicateError;
import guesthouse.service.ClientService;
import guesthouse.service.ReservationService;
import guesthouse.service.UserRoleService;

@Controller
public class ClientController {

	@Autowired
	private ClientService clientService;

	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private ReservationService reservationService;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addClient1(Model model) {
		Client newClient = new Client();
		model.addAttribute("newClient", newClient);
		return "addClient";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addClient2(@ModelAttribute("newClient") @Valid Client newClient, BindingResult result) {
		
		if (result.hasErrors()) {
			return "addClient";
		}
		
		UserRole userRole = new UserRole();
		userRole.setClientLogin(newClient.getClientLogin());
		userRole.setClientRole("ROLE_CLIENT");

		clientService.addClient(newClient);
		userRoleService.addUserRole(userRole);
		return "redirect:/login";
	}

	//wyj¹tek jeœli istnieje w bazie danych ten sam login
	@ExceptionHandler(ClientDuplicateError.class)
	public ModelAndView duplicateLogin(HttpServletRequest req, ClientDuplicateError error) {
		ModelAndView m = new ModelAndView();
		m.addObject("errorLogin", error.getClientLogin());
		m.setViewName("duplicateLogin");
		return m;
	}


	@RequestMapping(value = "/client/home", method = RequestMethod.GET)
	public String pageHome(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Client clientByLogin = clientService.findClientByLogin(login);
		model.addAttribute("client", clientByLogin);
		model.addAttribute("reservation", reservationService.getReservationsByClientId(clientByLogin));
		return "pageClient";
	}
	
	@RequestMapping(value = "/client/edit", method = RequestMethod.GET)
	public String editClient1(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Client client = clientService.findClientByLogin(login);
		model.addAttribute("client", client);
		return "editClient";
	}
	
	@RequestMapping(value = "/client/edit", method = RequestMethod.POST)
	public String editClient2(@ModelAttribute("client") @Valid Client client, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		clientService.updateClient(client);
		return "redirect:/client/home";
	}


	// do podgl¹du
	@RequestMapping(value = "/clients", method = RequestMethod.GET)
	public String getAllClients(Model model) {
		model.addAttribute("clients", clientService.getAllClients());
		return "clients";
	}
}
