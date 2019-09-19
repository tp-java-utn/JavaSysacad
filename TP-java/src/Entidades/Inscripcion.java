package Entidades;
import java.sql.Date;
import java.time.LocalDate;

public class Inscripcion {

	@Override
	public String toString() {
		return "Inscripcion [idInscripcion=" + idInscripcion + ", legajo=" + legajo + ", idDocente=" + idDocente
				+ ", idMateira=" + idMateria + ", idComision=" + idComision + ", fecha=" + fecha + "]";
	}
	int idInscripcion;
	String legajo;
	int idDocente;
	int idMateria;
	int idComision;
	Date fecha;
	
	public int getIdInscripcion() {
		return idInscripcion;
	}
	public void setIdInscripcion(int idInscripcion) {
		this.idInscripcion = idInscripcion;
	}
	public String getLegajo() {
		return legajo;
	}
	public void setLegajo(String legajo) {
		this.legajo = legajo;
	}
	public int getIdDocente() {
		return idDocente;
	}
	public void setIdDocente(int idDocente) {
		this.idDocente = idDocente;
	}
	public int getIdMateria() {
		return idMateria;
	}
	public void setIdMateria(int idMateira) {
		this.idMateria = idMateira;
	}
	public int getIdComision() {
		return idComision;
	}
	public void setIdComision(int idComision) {
		this.idComision = idComision;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date date) {
		this.fecha = date;
	}
}
