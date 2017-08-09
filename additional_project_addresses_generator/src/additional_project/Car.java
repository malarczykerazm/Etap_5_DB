package additional_project;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

public class Car {

	public static void main(String[] args) throws IOException {
		Scanner input = new Scanner(
				new File("C:/projects/crash_course/workspaces/Etap 5/additional_data_files/cars.csv"));
		String[] afterComma;

		int statusID;
		String type;
		String brand;
		String model;
		int productionYear;
		String colour;
		float engineVolume;
		int power;
		int mileage;
		String plateNumber;
		int toPlate;

		int i = 0;

		while (input.hasNextLine()) {
			i++;
			System.out.print("insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) ");
			afterComma = input.nextLine().split(",");
			statusID = Integer.parseInt(afterComma[0]);
			type = afterComma[1];
			brand = afterComma[2];
			model = afterComma[3];
			productionYear = Integer.parseInt(afterComma[4]);
			colour = afterComma[5];
			engineVolume = Float.parseFloat(afterComma[6]);
			power = Integer.parseInt(afterComma[7]);
			mileage = Integer.parseInt(afterComma[8]);
			toPlate = 15000 + (int)(Math.random() * 73000);
			plateNumber = afterComma[9] + Integer.toString(toPlate);
			
			System.out.println("values (" + statusID + ", '" + type + "', '" + brand + "', '" + model + "', " + productionYear + ", '" + colour + "', " + engineVolume + ", " + power + ", " + mileage + ", '" + plateNumber + "');");
		}
		System.out.println(i);

		input.close();
	}

}
