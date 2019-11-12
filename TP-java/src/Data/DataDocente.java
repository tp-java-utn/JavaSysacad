package Data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Entidades.Docente;
import Entidades.Materia;

public class DataDocente {
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	public Docente getOne(int id) 
	{
		Docente D = new Docente();
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select * from Docentes where idDocente=?");
			stmt.setInt(1, id);
			rs   = stmt.executeQuery();
			
			
			if(rs != null) {
				while(rs.next())
				{
				D.setNombre(rs.getString("nombre"));
				D.setApellido(rs.getString("apellido"));
				D.setTelefono(rs.getString("telefono"));
				D.setEmail(rs.getString("email"));
				D.setContraseña(rs.getString("contraseña"));
				}
			}
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return D;
	}
	
	public ArrayList<Docente> getAll()
	{
		ArrayList<Docente> Docentes = new ArrayList<Docente>();
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select * from Docentes");
			rs   = stmt.executeQuery();
			if(rs != null)
			{
				while(rs.next())
				{
					Docente D = new Docente();
					D.setNombre(rs.getString("nombre"));
					D.setApellido(rs.getString("apellido"));
					D.setTelefono(rs.getString("telefono"));
					D.setEmail(rs.getString("email"));
					D.setContraseña(rs.getString("contraseña"));
					
					//Agregar a la lista
					Docentes.add(D);
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return Docentes;
	}
	
	public Docente addDocente(String nombre,String apellido,String email, String telefono, String contraseña) 
	{
		//Crear nueva Docente
		Docente D = new Docente();
		D.setNombre(nombre);
		D.setApellido(apellido);
		D.setTelefono(telefono);
		D.setEmail(email);
		D.setContraseña(contraseña);
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into Docentes(nombre,apellido,email,telefono,contraseña) values(?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, D.getNombre());
			stmt.setString(2, D.getApellido());
			stmt.setString(3, D.getEmail());
			stmt.setString(4, D.getTelefono());
			stmt.setString(5, D.getContraseña());			
			stmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return D;
		
	}
	
	public void delete(int id)
	{
		
		try {
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("delete from Docentes where idDocentes = ?");
			stmt.setInt(1, id);
			stmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
