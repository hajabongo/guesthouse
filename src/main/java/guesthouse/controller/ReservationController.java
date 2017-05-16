package guesthouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import guesthouse.service.ReservationService;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("/reservation")
	public String process(@RequestParam("id")String roomId) {
		reservationService.processReservation(roomId);
		return "redirect:/rooms";
	}
}
