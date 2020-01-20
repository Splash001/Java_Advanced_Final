package ua.lviv.lgs.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView addRegistration(@Valid @ModelAttribute("facultyRegistration") FacultyRegistration fr,
			BindingResult bindingResult) {
		Faculty faculty = facultyService.findById(fr.getFacultyId());
		User user = userService.findByEmail(fr.getEmail());
		fr.setFaculty(faculty);
		fr.setUser(user);
		facultyRegistrationService.save(fr);
		return new ModelAndView("redirect:/home");
	}

}
