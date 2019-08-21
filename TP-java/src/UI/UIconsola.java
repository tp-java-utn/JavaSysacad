package UI;

import java.util.ArrayList;
import java.util.Scanner;

import Data.*;
import Entidades.*;
import Entidades.Materia.estados;
import Logic.Validator;


public class UIconsola {

	public static void main(String[] args) {
		
		
		
		//test git
		//System.out.println(DA.getOne("43904").toString()); 
		//DA.addAlumno("Agustin","Gonzales","44539","4569987","agozanles@gmail.com","asd4568","Mexico",1456);
		//DA.addAlumno("test","tes","1","455557","test@gmail.com","test123","test",123);
		//DA.delete("1");
		
		System.out.println("ALUMNOS");
		DataAlumno DA = new DataAlumno();
		ArrayList<Alumno> alumnos =DA.getAll(); 
		for (Alumno A:alumnos) 
		{
			System.out.println(A.toString());
			System.out.println("");
		}
		
		
		System.out.println("DIRECCIONES");
		DataDireccion DD = new DataDireccion();
		ArrayList<Direccion> direcciones =DD.getAll(); 
		for (Direccion D:direcciones) 
		{
			System.out.println(D.toString());
		}
		System.out.println("");
		
		
		System.out.println("MATERIAS");
		DataMateria DM = new DataMateria();
		ArrayList<Materia> Materias =DM.getAll(); 
		for (Materia M:Materias) 
		{
			System.out.println(M.toString());
		}
		
		Materia m = new Materia();
		m.setEstado(estados.Libre);
		System.out.println(m.getEstado());
		
		
		Validator v = new Validator();
		System.out.println(v.emailOk("fede@hotmail.com.ar",1,25));
		/*Scanner s= new Scanner(System.in);
		Alumno A2 = new Alumno();
		System.out.println("Ingrese nombre:");
		A2.setNombre(s.nextLine());
		System.out.println("Ingrese Apellido:");
		A2.setApellido(s.nextLine());
		System.out.println("Ingrese Legajo:");
		A2.setLegajo(s.nextLine());
		System.out.println("Ingrese Telefono:");
		A2.setTelefono(s.nextLine());
		System.out.println("Ingrese email:");
		A2.setEmail(s.nextLine());
		System.out.println("Ingrese Contraseña:");
		A2.setContraseña(s.nextLine());*/
	}	
}
