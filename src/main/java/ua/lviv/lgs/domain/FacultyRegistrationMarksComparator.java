package ua.lviv.lgs.domain;

import java.util.Comparator;

public class FacultyRegistrationMarksComparator implements Comparator<FacultyRegistration> {

	@Override
	public int compare(FacultyRegistration o1, FacultyRegistration o2) {

		return o1.getSumOfMarks() < o2.getSumOfMarks() ? 1 : -1;
	}

}
