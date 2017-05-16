package guesthouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import guesthouse.domain.repository.RoomRepository;
import guesthouse.service.RoomService;

@Controller
@RequestMapping("/rooms")
public class RoomController {

	@Autowired
	private RoomService roomService;
	
	@RequestMapping
	public String list(Model model) {
		model.addAttribute("rooms", roomService.getAllRooms());
		return "rooms";
	}
	
	@RequestMapping("/room")
	public String getProductById(Model model, @RequestParam("id") String roomId) {
		model.addAttribute("room", roomService.getRoomById(roomId));
		return "room";
	}
}
