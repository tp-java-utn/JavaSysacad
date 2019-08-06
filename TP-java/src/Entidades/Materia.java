package Entidades;

public class Materia {
	
	@Override
	public String toString() {
		if(idMateria>9)
		{return idMateria + " - " + cursado + ", " + nombre + ".";}
		else
		{return idMateria + "  - " + cursado + ", " + nombre + "." ;}
	}
	
	public enum estados
	{
		Libre,
		Cursando,
		Regular,
		Aprobada
	}
	
	int idMateria;
	String nombre;
	String descripcion;
	String cursado;
	estados estado = estados.Libre;
	
	public estados getEstado(){
		return estado;
	}
	
	public void setEstado(estados estado) {
		this.estado = estado;
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
