package Entidades;

public class Alumno extends Persona {	
	
	private String legajo;
	private double promedio;
	
	@Override
	public String toString() {
		return "Alumno: "+ getNombre()+", "+getApellido() +
			   "\n Legajo: "+ getLegajo() +
			   "\n E-mail: "+ getEmail() +
			   "\n Telefono: "+ getTelefono() +
			   "\n Contrase�a: "+ getContrase�a() +
			   "\n Direccion: "+ getDireccion().toString() +
			   "\n Estado: "+ getEstadoPersona();
			   
	}

	public Alumno()
	{
	}
	
	public Alumno(String nombre, String apellido, String email,String contrase�a,String telefono, String legajo, String calle,int numero)
	{
		this.setApellido(apellido);
		this.setNombre(nombre);
		this.setEmail(email);
		this.setContrase�a(contrase�a);
		this.setTelefono(telefono);
		this.setLegajo(legajo);
		Direccion dir = new Direccion(calle,numero);
		this.setDireccion(dir);
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
	
}
