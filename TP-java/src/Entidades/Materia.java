package Entidades;

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
	
}
