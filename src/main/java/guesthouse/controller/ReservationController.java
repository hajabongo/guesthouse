package guesthouse.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import guesthouse.domain.Reservation;
import guesthouse.domain.Room;
import guesthouse.exeption.ClientDuplicateError;
import guesthouse.exeption.ReservationStartStopError;
import guesthouse.service.ClientService;
import guesthouse.service.ReservationService;
import guesthouse.service.RoomService;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private ClientService clientService;
	
	
	@RequestMapping(value = "/reservation/add", method = RequestMethod.GET) 
	public String addReservation(@RequestParam("id") String roomId, Model model) {
		Reservation newReservation = new Reservation();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		newReservation.setIdClient(clientService.findClientByLogin(login).getId());
		model.addAttribute("room", roomService.getRoomById(roomId));
		model.addAttribute("newReservation", newReservation);
		model.addAttribute("client", clientService.findClientByLogin(login));
		return "addReservation";
	}
	
	@RequestMapping(value="/reservation/add", method=RequestMethod.POST)
	public String addClient(@ModelAttribute("newReservation")@Valid Reservation newReservation, BindingResult result, HttpServletRequest request, Model model) {
		if (result.hasErrors()) {
			return "addReservation";
		}
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		newReservation.setIdClient(clientService.findClientByLogin(login).getId());	
		reservationService.addReservation(newReservation);
		return "reservationConfirm";
	}
	
	@ExceptionHandler(ReservationStartStopError.class)
	public ModelAndView errorReservation(HttpServletRequest req, ReservationStartStopError error) {
		ModelAndView m = new ModelAndView();
		m.addObject("errorIdRoom", error.getIdRoom());
		m.addObject("errorDataStart", error.getdataStart());
		m.addObject("errorDataStop", error.getdataStop());
		m.setViewName("errorReservation");
		return m;
	}

}
