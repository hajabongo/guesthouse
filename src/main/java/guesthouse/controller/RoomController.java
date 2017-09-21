package guesthouse.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.fabric.xmlrpc.base.Array;

import guesthouse.domain.Client;
import guesthouse.domain.Reservation;
import guesthouse.domain.Room;
import guesthouse.domain.repository.RoomRepository;
import guesthouse.service.ReservationService;
import guesthouse.service.RoomService;

@Controller
@RequestMapping("/rooms")
public class RoomController {

	@Autowired
	private RoomService roomService;

	@Autowired
	private ReservationService reservationService;

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		Reservation reservation = new Reservation();
		model.addAttribute("reservation", reservation);
		model.addAttribute("rooms", roomService.getAllRooms());
		return "rooms";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String addFilter1(@ModelAttribute("reservation") @Valid Reservation reservation, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "rooms";
		}

		List<Room> newList = new ArrayList<Room>();
		List<Reservation> allFilterReservation = new ArrayList<Reservation>();

		for (Room r : roomService.getAllRooms()) {
			newList.add(r);
		}

		allFilterReservation = reservationService.getAllFilterReservations(reservation.getDataStart(),
				reservation.getDataStop());

		for (Reservation r : allFilterReservation) {
			String i = String.valueOf(r.getIdRoom());
			newList.remove(roomService.getRoomById(i));
		}
		model.addAttribute("rooms", newList);
		return "rooms";
	}
}
