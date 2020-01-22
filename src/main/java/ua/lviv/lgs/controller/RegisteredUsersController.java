package ua.lviv.lgs.controller;

import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ua.lviv.lgs.domain.Faculty;
import ua.lviv.lgs.domain.FacultyRegistration;
import ua.lviv.lgs.domain.FacultyRegistrationMarksComparator;
import ua.lviv.lgs.service.FacultyService;
import ua.lviv.lgs.service.FacultyRegistrationService;

@Controller
public class RegisteredUsersController {

	@Autowired
	private FacultyRegistrationService facultyRegistrationService;

	@Autowired
	private FacultyService facultyService;

	@GetMapping("/show-entrants")
	public ModelAndView showAllRegisteredUsers() {
		return new ModelAndView("showRegistrations", "facultyRegistrations",
				facultyRegistrationService.getAllRegisteredUsers());
	}

	@GetMapping("/show-enrolled-entrants")
	public ModelAndView showEnrolledEntrants(@RequestParam Integer facultyId) {
		Faculty faculty = facultyService.findById(facultyId);
		ModelAndView mav = new ModelAndView("showEnrolledEntrants");
		mav.addObject("faculty", faculty);
		List<FacultyRegistration> registeredEntrants = facultyRegistrationService.getAllRegisteredUsers();
		registeredEntrants = registeredEntrants.stream().filter(r -> r.getFaculty().getId() == facultyId)
				.sorted(new FacultyRegistrationMarksComparator()).collect(Collectors.toList());
		mav.addObject("numberOfEntrants", registeredEntrants.size());
		List<FacultyRegistration> enrolledEntrants = registeredEntrants;
		;
		List<FacultyRegistration> notEnrolledEntrants = null;
		if (faculty.getNumberOfStudents() < registeredEntrants.size()) {
			enrolledEntrants = registeredEntrants.subList(0, faculty.getNumberOfStudents());
			notEnrolledEntrants = registeredEntrants.subList(faculty.getNumberOfStudents(), registeredEntrants.size());
		}
		mav.addObject("enrolledEntrants", enrolledEntrants);
		mav.addObject("notEnrolledEntrants", notEnrolledEntrants);
		return mav;
	}
}
