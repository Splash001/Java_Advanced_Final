package ua.lviv.lgs.service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.domain.FacultyRegistration;
import ua.lviv.lgs.repository.FacultyRegistrationRepo;

@Service
public class FacultyRegistrationService {

	private Logger logger = LoggerFactory.getLogger(FacultyRegistrationService.class);

	@Autowired
	private FacultyRegistrationRepo facultyRegistrationRepo;

	public void save(FacultyRegistration facultyRegistration) {
		facultyRegistrationRepo.save(facultyRegistration);
		logger.debug("Adding a new registratin for faculty " + facultyRegistration);
	}

	public List<FacultyRegistration> getAllRegisteredUsers() {
		logger.debug("Selecting all registrations for faculties");
		return facultyRegistrationRepo.findAll();
	}
}
