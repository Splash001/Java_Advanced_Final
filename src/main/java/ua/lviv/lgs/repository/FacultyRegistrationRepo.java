package ua.lviv.lgs.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ua.lviv.lgs.domain.FacultyRegistration;

@Repository
public interface FacultyRegistrationRepo extends JpaRepository<FacultyRegistration, Integer>{

}
