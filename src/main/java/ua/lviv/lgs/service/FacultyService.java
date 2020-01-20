package ua.lviv.lgs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.domain.Faculty;
import ua.lviv.lgs.repository.FacultyRepository;

@Service
public class FacultyService {

	@Autowired
	private FacultyRepository facultyRepo;

	public void save(Faculty faculty) {
		facultyRepo.save(faculty);
	}

	public List<Faculty> getAllFaculties() {
		return facultyRepo.findAll();
	}

	public Faculty findById(Integer id) {
		return facultyRepo.findById(id).get();
	}
}
