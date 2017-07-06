package guesthouse.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
		model.addAttribute("rooms", roomService.getAllRooms());
		model.addAttribute("reservation", reservation);
		System.out.println(roomService.getAllRooms());
		return "rooms";
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String addFilter1(@ModelAttribute("reservation")@Valid Reservation reservation, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "rooms";
		}
		
		List<Room> newList = new ArrayList<Room>();
		List<Reservation> allFilterReservation = new ArrayList<Reservation>();
		for (Room r : roomService.getAllRooms()) {
			newList.add(r);
		}
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
				System.out.println();
				newList.remove(roomService.getRoomById(r.getIdRoom()));
			}
		} catch (Exception e) {
			System.err.println("ERROR r");
		}
		System.out.println(newList);

		model.addAttribute("rooms", newList);
		return "rooms";
	}


	@RequestMapping("/room")
	public String getProductById(Model model, @RequestParam("id") String roomId) {
		model.addAttribute("room", roomService.getRoomById(roomId));
		return "room";
	}
}
