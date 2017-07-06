package guesthouse.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import guesthouse.domain.Client;
import guesthouse.domain.Reservation;
import guesthouse.domain.Room;
import guesthouse.service.ReservationService;
import guesthouse.service.RoomService;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	@Autowired
	private RoomService roomService;
	
	@RequestMapping(value = "/reservation/add", method = RequestMethod.GET) 
	public String addReservation(Model model) {
		Reservation newReservation = new Reservation();
		model.addAttribute("newReservation", newReservation);
		return "addReservation";
	}
	
	@RequestMapping(value="/reservation/add", method=RequestMethod.POST)
	public String addClient(@ModelAttribute("newReservation") Reservation newReservation) {
		reservationService.addReservation(newReservation);
		return "redirect:/client";
	}

	
	
	
	// Admin
	@RequestMapping(value = "/reservations", method = RequestMethod.GET)
	public String getAllClients(Model model) {
		model.addAttribute("reservations", reservationService.getAllReservations());
		return "reservations";
	}

	// Admin
	@RequestMapping(value = "reservations/filter", method = RequestMethod.POST)
	public String addReservationByFilter(@ModelAttribute("reservation") Reservation reservation, Model model) {
		System.out.println(reservation.getDataStart());
		Set<Room> newList = new HashSet<Room>();
		List<Reservation> allFilterReservation = new ArrayList<Reservation>();
		try {
			allFilterReservation = reservationService.getAllFilterReservations(reservation.getDataStart(),
					reservation.getDataStop());
		} catch (Exception e) {
			System.err.println("ERROR allFilterReservation");
		}
		allFilterReservation = reservationService.getAllFilterReservations(reservation.getDataStart(),
				reservation.getDataStop());
		System.out.println(allFilterReservation);
		try {
			for (Reservation r : allFilterReservation) {
				newList.add(roomService.getRoomById(r.getIdRoom()));
			}
		} catch (Exception e) {
			System.err.println("ERROR r");
		}
		System.out.println(newList);

		model.addAttribute("rooms", newList);
		return "rooms";
	}
}
