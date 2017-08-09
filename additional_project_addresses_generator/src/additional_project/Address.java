package additional_project;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

public class Address {

	public static void main(String[] args) throws IOException {
		Scanner input = new Scanner(
				new File("C:/projects/crash_course/workspaces/Etap 5/additional_data_files/addresses.csv"));
		String[] afterComma;

		String number;
		String street;
		String city;
		String postcode;
		String country;

		int i = 0;

		while (input.hasNextLine()) {
			i++;
			System.out.println("insert into addresses(number, street, postcode, city, country)");
			afterComma = input.nextLine().split(",");
			number = afterComma[2];
			street = afterComma[3];
			city = afterComma[5];
			postcode = afterComma[afterComma.length - 2];
			country = afterComma[afterComma.length - 1];
			System.out.println("values ('" + number + "', '" + street + "', '" + postcode + "', '" + city
					+ "', '" + country + "');");
			System.out.println();
		}
		System.out.println(i);

		input.close();
	}

}
