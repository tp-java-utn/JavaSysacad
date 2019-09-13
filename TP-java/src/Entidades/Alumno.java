package Entidades;

import java.util.ArrayList;

import Data.DataEstadoAcademico;
import Data.DataMateria;
import Entidades.EstadoAcademico.estadosMateria;

public class Alumno extends Persona {	
	
	private String legajo;
	private double promedio;
	private Carreras carrera;
	
	public enum Carreras{
		Sistema,
		Mecanica,
		Quimica,
		Civil,
		Electrica
	}
	
	@Override
	public String toString() {
		return "Alumno: "+ getNombre()+", "+getApellido() +
			   "\n Legajo: "+ getLegajo() +
			   "\n E-mail: "+ getEmail() +
			   "\n Telefono: "+ getTelefono() +
			   "\n Contraseña: "+ getContraseña() +
			   "\n Direccion: "+ getDireccion().toString() +
			   "\n Estado: "+ getEstadoPersona();
			   
	}

	public Alumno()
	{
	}
	
	public Alumno(String nombre, String apellido, String email,String contraseña,String telefono, String legajo, String calle,int numero)
	{
		this.setApellido(apellido);
		this.setNombre(nombre);
		this.setEmail(email);
		this.setContraseña(contraseña);
		this.setTelefono(telefono);
		this.setLegajo(legajo);
		Direccion dir = new Direccion(calle,numero);
		this.setDireccion(dir);
	}
	
	public Carreras getCarrera() {
		return carrera;
	}

	public void setCarrera(Carreras carrera) {
		this.carrera = carrera;
	}

	public String getLegajo() {
		return legajo;
	}
	public void setLegajo(String legajo) {
		this.legajo = legajo;
	}
	public double getPromedio() {
		return promedio;
	}
	public void setPromedio(double promedio) {
		this.promedio = promedio;
	}
	
	public ArrayList<EstadoAcademico> getEstadosAcedemicos(ArrayList<EstadoAcademico> Estados)
	{
		ArrayList<EstadoAcademico> EstadosAcademicos = new ArrayList<EstadoAcademico>();
		
		for(EstadoAcademico EAS:Estados) 
		{
			if(EAS.getLegajo().equals(this.getLegajo()))
			{
				EstadosAcademicos.add(EAS);
			}
		}
		return EstadosAcademicos;
	}
	
	public void startEstadoAcademico() 
	{
		DataEstadoAcademico EA = new DataEstadoAcademico();
		DataMateria DM = new DataMateria();
    	ArrayList<Materia> Materias = DM.getAll();
    	for(Materia M:Materias)
    	{
    		EA.addEstadoAcademico(this.legajo, M.getIdMateria(), estadosMateria.Libre, 0, 0);
    	}
    	
	}
}
