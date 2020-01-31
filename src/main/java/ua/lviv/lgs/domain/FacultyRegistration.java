package ua.lviv.lgs.domain;

import java.util.List;
import java.io.IOException;
import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "faculty_registrations")
public class FacultyRegistration {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@ManyToOne()
	@JoinColumn(name = "faculty_id", referencedColumnName = "id")
	private Faculty faculty;

	@ManyToOne()
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User user;

	private String base64;

	@ElementCollection
	private List<Integer> marks;

	@Column(name = "sum_of_marks")
	private Integer sumOfMarks;

	@Transient
	private int facultyId;

	@Transient
	private String email;

	public FacultyRegistration() {
	}

	public FacultyRegistration(Faculty faculty, User user, List<Integer> marks, MultipartFile file) throws IOException {
		this.faculty = faculty;
		this.user = user;
		this.marks = marks;
		this.base64 = Base64.getEncoder().encodeToString(file.getBytes());
		this.sumOfMarks = 0;
		for (int mark : this.marks)
			sumOfMarks += mark;
	}

	public FacultyRegistration(Integer id, Faculty faculty, User user, List<Integer> marks, MultipartFile file)
			throws IOException {
		this.id = id;
		this.faculty = faculty;
		this.user = user;
		this.marks = marks;
		this.base64 = Base64.getEncoder().encodeToString(file.getBytes());
		this.sumOfMarks = 0;
		for (int mark : this.marks)
			sumOfMarks += mark;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Integer> getMarks() {
		return marks;
	}

	public void setMarks(List<Integer> marks) {
		this.marks = marks;
	}

	public int getFacultyId() {
		return facultyId;
	}

	public String getEmail() {
		return email;
	}

	public void setFacultyId(int facultyId) {
		this.facultyId = facultyId;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBase64() {
		return base64;
	}

	public void setBase64(String base64) {
		this.base64 = base64;
	}

	public Integer getSumOfMarks() {
		return sumOfMarks;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((base64 == null) ? 0 : base64.hashCode());
		result = prime * result + ((faculty == null) ? 0 : faculty.hashCode());
		result = prime * result + ((marks == null) ? 0 : marks.hashCode());
		result = prime * result + ((sumOfMarks == null) ? 0 : sumOfMarks.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FacultyRegistration other = (FacultyRegistration) obj;
		if (base64 == null) {
			if (other.base64 != null)
				return false;
		} else if (!base64.equals(other.base64))
			return false;
		if (faculty == null) {
			if (other.faculty != null)
				return false;
		} else if (!faculty.equals(other.faculty))
			return false;
		if (marks == null) {
			if (other.marks != null)
				return false;
		} else if (!marks.equals(other.marks))
			return false;
		if (sumOfMarks == null) {
			if (other.sumOfMarks != null)
				return false;
		} else if (!sumOfMarks.equals(other.sumOfMarks))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}
}