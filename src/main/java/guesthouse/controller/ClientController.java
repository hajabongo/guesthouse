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
import guesthouse.exeption.ClientDuplicateError;
import guesthouse.service.ClientService;

@Controller
public class ClientController {

	@Autowired
	private ClientService clientService;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String form(Model model) {
		Client newClient = new Client();
		model.addAttribute("newClient", newClient);
		return "addClient";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addClient(@ModelAttribute("newClient") @Valid Client newClient, BindingResult result) {
		if (result.hasErrors()) {
			return "addClient";
		}
		
		clientService.addClient(newClient);
		// if(clientService.findClientByLogin(newClient.getClientLogin()) ==
		// true) {
		// System.out.println("w bazie danych jest ju¿ podany login");
		// }else {
		// System.out.println("w bazie danych nie ma loginu");
		// }
		return "redirect:/";
	}

	@ExceptionHandler(ClientDuplicateError.class)
	public ModelAndView duplicateLogin(HttpServletRequest req, ClientDuplicateError error) {
		ModelAndView m = new ModelAndView();
		m.addObject("errorLogin", error.getClientLogin());
		m.setViewName("duplicateLogin");
		return m;
	}
	
//	@ExceptionHandler(ClientDuplicateError.class)
//	public String duplicateLogin(ClientDuplicateError error, Model m) {
//		m.addAttribute("errorLogin", error.getClientLogin());
//		return "addClient";
//	}
	
	@RequestMapping(value = "/client/home", method = RequestMethod.GET)
	public String pageHome(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		model.addAttribute("client", clientService.findClientByLogin(login));
		return "pageHomeClient";
	}

	@RequestMapping(value = "/client")
	public String client() {
		return "pageHomeClient";
	}

	// do podgl¹du
	@RequestMapping(value = "/clients", method = RequestMethod.GET)
	public String getAllClients(Model model) {
		model.addAttribute("clients", clientService.getAllClients());
		return "clients";
	}
}
