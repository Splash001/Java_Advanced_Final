package ua.lviv.lgs.service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.domain.Faculty;
import ua.lviv.lgs.repository.FacultyRepository;

@Service
public class FacultyService {

	private Logger logger = LoggerFactory.getLogger(FacultyService.class);

	@Autowired
	private FacultyRepository facultyRepo;

	public void save(Faculty faculty) {
		facultyRepo.save(faculty);
		logger.debug("Adding a new faculty " + faculty);
	}

	public List<Faculty> getAllFaculties() {
		logger.debug("Selecting all faculties");
		return facultyRepo.findAll();
	}

	public Faculty findById(Integer id) {
		logger.debug("Selecting a faculty with id " + id);
		return facultyRepo.findById(id).get();
	}
}
