package Entidades;

import java.util.ArrayList;

import Data.DataEstadoAcademico;
import Entidades.EstadoAcademico.*;

public class Materia {
	
	@Override
	public String toString() {
		if(idMateria>9)
		{return idMateria + " - " + cursado + ", " + nombre + ".";}
		else
		{return idMateria + "  - " + cursado + ", " + nombre + "." ;}
	}
	
	
	
	int idMateria;
	String nombre;
	String descripcion;
	String cursado;
	String año;
	String correlativasRegulares;
	String correlativasAprobadas;
	String correlativasRendir;
	
	
	
	public String getCorrelativasRegulares() {
		return correlativasRegulares;
	}

	public void setCorrelativasRegulares(String correlativasRegulares) {
		this.correlativasRegulares = correlativasRegulares;
	}

	public String getCorrelativasAprobadas() {
		return correlativasAprobadas;
	}

	public void setCorrelativasAprobadas(String correlativasAprobadas) {
		this.correlativasAprobadas = correlativasAprobadas;
	}

	public String getCorrelativasRendir() {
		return correlativasRendir;
	}

	public void setCorrelativasRendir(String correlativasRendir) {
		this.correlativasRendir = correlativasRendir;
	}

	public String getAño() {
		return año;
	}

	public void setAño(String año) {
		this.año = año;
	}

	public int getIdMateria() {
		return idMateria;
	}
	public void setIdMateria(int idMateria) {
		this.idMateria = idMateria;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getdescripcion() {
		return descripcion;
	}
	public void setdescripcion(String descp) {
		this.descripcion = descp;
	}
	public String getcursado() {
		return cursado;
	}
	public void setcursado(String curs) {
		this.cursado = curs;
	}
	
	public int[] readCorrelativasAprobadas() {
		
		if(this.correlativasAprobadas!=null)
		{
			int[] intArray = new int[this.correlativasAprobadas.length()];
			int numberlenght = 1;
			int pos = 0;
			
			for(int i=0;i<this.correlativasAprobadas.length();i++)
			{
				if(this.correlativasAprobadas.charAt(i) != '-')
				{		
					if(numberlenght<=1)
					{
						//primer digito
						intArray[pos] = Character.getNumericValue(this.correlativasAprobadas.charAt(i));				
						numberlenght++;
					}
					else
					{
						//segundo digito
						intArray[pos] = Integer.valueOf(String.valueOf(intArray[pos])+String.valueOf(this.correlativasAprobadas.charAt(i)));				
						numberlenght = 1;
					}
					
				}
				else
				{
					pos++;
				}
			}
			return intArray;
		}
		else
		{
			int[] intArray = new int[1];
			intArray[0]=0;
			return intArray;
		}
	}
	
	public int[] readCorrelativasRendir() {
		
		if(this.correlativasRendir!=null)
		{
			int[] intArray = new int[correlativasRendir.length()];
			int numberlenght = 1;
			int pos = 0;
			
			if(!this.correlativasRendir.equals("Todas"))
			{			
				for(int i=0;i<this.correlativasRendir.length();i++)
				{
					if(this.correlativasRendir.charAt(i) != '-')
					{		
						if(numberlenght<=1)
						{
							//primer digito
							intArray[pos] = Character.getNumericValue(this.correlativasRendir.charAt(i));				
							numberlenght++;
						}
						else
						{
							//segundo digito
							intArray[pos] = Integer.valueOf(String.valueOf(intArray[pos])+String.valueOf(this.correlativasRendir.charAt(i)));				
							numberlenght = 1;
						}
						
					}
					else
					{
						pos++;
					}
				}
			}
			return intArray;
		}
		else
		{
			int[] intArray = new int[1];
			intArray[0]=0;
			return intArray;
		}
	}

	
	public int[] readCorrelativasRegulares() {
		
		if(this.correlativasRegulares!=null)
		{
			int[] intArray = new int[correlativasRegulares.length()];
			int numberlenght = 1;
			int pos = 0;
			
			for(int i=0;i<this.correlativasRegulares.length();i++)
			{
				if(this.correlativasRegulares.charAt(i) != '-')
				{		
					if(numberlenght<=1)
					{
						//primer digito
						intArray[pos] = Character.getNumericValue(this.correlativasRegulares.charAt(i));				
						numberlenght++;
					}
					else
					{
						//segundo digito
						intArray[pos] = Integer.valueOf(String.valueOf(intArray[pos])+String.valueOf(this.correlativasRegulares.charAt(i)));				
						numberlenght = 1;
					}
					
				}
				else
				{
					pos++;
				}
			}
			return intArray;
		}
		else
		{
			int[] intArray = new int[1];
			intArray[0]=0;
			return intArray;
		}
	}
	
	public boolean AlumnoPuedeCursar(String legajo)
	{
		//DataEstadoAcademico
		DataEstadoAcademico DEA = new DataEstadoAcademico();
		
		//correlativas necesarias
		int[] regulares = this.readCorrelativasRegulares();
		int[] aprobadas = this.readCorrelativasAprobadas();
		
		
		//regulares
		int acumRegular = 0;
		int valRegular = 0;
		
		for(int i=0; i<regulares.length;i++)
		{
			if(DEA.getOne(legajo, regulares[i]).getEstado().equals(estadosMateria.Regular.toString()))
			{
				System.out.println("Regular "+regulares[i]+": OK");
				valRegular++;
				acumRegular++;
			}
			else if(regulares[i]==0)
			{
				//nada
			}
			else
			{
				System.out.println("Regular "+regulares[i]+": not OK");
				acumRegular--;
			}
		}
		
		//aprobadas
		int acumAprobar = 0;
		int valAprobar = 0;
		
		for(int i=0; i<aprobadas.length;i++)
		{
			if(DEA.getOne(legajo, aprobadas[i]).getEstado().equals(estadosMateria.Aprobada.toString()))
			{
				System.out.println("Aprobada "+aprobadas[i]+": OK");
				valAprobar++;
				acumAprobar++;
			}
			else if(aprobadas[i]==0)
			{
				//nada
			}
			else
			{
				System.out.println("Aprobada "+aprobadas[i]+": not OK");
				acumAprobar--;
			}
		}
				
		
		if(acumRegular==valRegular && acumAprobar==valAprobar)
		{
			return true;
		}
		else
		{
			return false;
		}

	}
	
}
