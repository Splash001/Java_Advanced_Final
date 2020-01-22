package ua.lviv.lgs.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ua.lviv.lgs.domain.Faculty;
import ua.lviv.lgs.domain.FacultyRegistration;
import ua.lviv.lgs.domain.User;
import ua.lviv.lgs.service.FacultyRegistrationService;
import ua.lviv.lgs.service.FacultyService;
import ua.lviv.lgs.service.UserService;

@Controller
public class RegistrationController {

	@Autowired
	private UserService userService;

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private FacultyRegistrationService facultyRegistrationService;

	@GetMapping("/register-for-faculty")
	public ModelAndView registerForFaculty(@RequestParam("facultyId") Integer id, @RequestParam("email") String email) {
		Faculty faculty = facultyService.findById(id);
		User user = userService.findByEmail(email);
		FacultyRegistration fr = new FacultyRegistration();
		fr.setFaculty(faculty);
		fr.setUser(user);
		ModelAndView mav = new ModelAndView("registerForFaculty");
		mav.addObject("facultyRegistration", fr);
		return mav;
	}

	@PostMapping("/register-for-faculty")
	public String addRegistration(@RequestParam MultipartFile image, @RequestParam List<Integer> marks,
			@RequestParam Integer facultyId, @RequestParam String email) throws IOException {
		Faculty faculty = facultyService.findById(facultyId);
		User user = userService.findByEmail(email);
		FacultyRegistration fr = new FacultyRegistration(faculty, user, marks, image);
		facultyRegistrationService.save(fr);
		return "redirect:/home";
	}

}
