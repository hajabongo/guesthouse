package guesthouse.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import guesthouse.domain.Reservation;
import guesthouse.domain.UserRole;
import guesthouse.service.ClientService;
import guesthouse.service.ReservationService;
import guesthouse.service.UserRoleService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private ClientService clientService;
	@Autowired
	private UserRoleService userRoleService;
	
	@RequestMapping(value="/reservations", method=RequestMethod.GET)
	public String allReservations(Model model) {
		Reservation reservation = new Reservation();
		model.addAttribute("reservation", reservation);
		model.addAttribute("reservations", reservationService.getAllReservationsSortByDate());
		return "pageAdmin";
	}
	
	@RequestMapping(value="/reservations", method=RequestMethod.POST)
	public String filterReservationsByDate(@ModelAttribute("reservation") @Valid Reservation reservation, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "pageAdmin";
		}
		
		List<Reservation> allFilterReservation = new ArrayList<Reservation>();
		allFilterReservation = reservationService.getAllFilterReservations(reservation.getDataStart(),
				reservation.getDataStop());
		model.addAttribute("reservations",allFilterReservation);
		return "pageAdmin";
	}
	
	@RequestMapping(value="/confirm")
	public String confirmReservation(@RequestParam("id") String reservationId) {
		reservationService.confirmReservation(reservationService.getReservationById(reservationId));
		return "redirect:/admin/reservations";
	}
	
	@RequestMapping(value="/break")
	public String breakReservation(@RequestParam("id") String reservationId) {
		reservationService.breakReservation(reservationService.getReservationById(reservationId));
		return "redirect:/admin/reservations";
	}

	@RequestMapping(value="/filter/confirm")
	public String filterConfirm(Model model) {
		Reservation reservation = new Reservation();
		model.addAttribute("reservation", reservation);
		model.addAttribute("reservations", reservationService.getConfirmReservations());
		return "pageAdmin";
	}
	
	@RequestMapping(value="/filter/break")
	public String filterBreak(Model model) {
		Reservation reservation = new Reservation();
		model.addAttribute("reservation", reservation);
		model.addAttribute("reservations", reservationService.getBreakReservations());
		return "pageAdmin";
	}
	
	@RequestMapping(value="/filter/wait")
	public String filterWait(Model model) {
		Reservation reservation = new Reservation();
		model.addAttribute("reservation", reservation);
		model.addAttribute("reservations", reservationService.getWaitingReservations());
		return "pageAdmin";
	}
	
	@RequestMapping(value="/delete/reservation") 
	public String deleteReservationById(@RequestParam("id") String reservationId) {
		reservationService.deleteReservation(reservationService.getReservationById(reservationId));
		return "redirect:/admin/reservations";
	}
	
	@RequestMapping(value="/clients")
	public String getAllClients(Model model) {
		model.addAttribute("clients", clientService.getAllClients());
		return "clients";
	}
	
	@RequestMapping(value="/delete/client") 
	public String deleteClientById(@RequestParam("id") String clientId) {
		int id = Integer.valueOf(clientId);
		reservationService.deleteReservationsByClientId(clientId);
		userRoleService.deleteUserRole(userRoleService.getUserRoleByClientId(clientId));
		clientService.deleteClient(clientService.findClientById(id));
		return "redirect:/admin/clients";
	}
}
