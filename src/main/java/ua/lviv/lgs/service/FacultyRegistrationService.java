package ua.lviv.lgs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.domain.FacultyRegistration;
import ua.lviv.lgs.repository.FacultyRegistrationRepo;

@Service
public class FacultyRegistrationService {

	@Autowired
	private FacultyRegistrationRepo facultyRegistrationRepo;

	public void save(FacultyRegistration facultyRegistration) {
		facultyRegistrationRepo.save(facultyRegistration);
	}

	public List<FacultyRegistration> getAllRegisteredUsers() {
		return facultyRegistrationRepo.findAll();
	}
}
