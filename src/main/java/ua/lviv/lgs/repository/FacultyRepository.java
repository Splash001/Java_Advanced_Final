package ua.lviv.lgs.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ua.lviv.lgs.domain.Faculty;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Integer>{

}
