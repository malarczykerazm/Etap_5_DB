package additional_project;

import java.io.File;
import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

public class Employee {

	public static void main(String[] args) throws IOException {
		Scanner input = new Scanner(
				new File("C:/projects/crash_course/workspaces/Etap 5/additional_data_files/employees.csv"));
		String[] afterComma;

		String name;
		String surname;
		
		int day;
		int month;
		int year;
		String dateOfBirth;
		
		Random random = new Random();
		
		int i = 0;

		while(input.hasNextLine()) {
			i++;
			System.out.println("insert into address(name, surname)");
			afterComma = input.nextLine().split(",");
			name = afterComma[0];
			surname = afterComma[1];
			day = 1 + (int)(Math.random() * 27);
			month = 1 + (int)(Math.random() * 11);
			year = 1940 + (int)(Math.random() * 59);
			dateOfBirth = Integer.toString(day) + "-" + Integer.toString(month) + "-" + Integer.toString(year);
			System.out.println("values (\"" + name + "\", \"" + surname + "\", \"" + dateOfBirth + "\");");
			System.out.println();
		}
		System.out.println(i);
			
		input.close();
	}

}

