package Data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Entidades.Direccion;
import Entidades.Docente;
import Entidades.Materia;
import Entidades.Persona.EstadosPersona;

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
				D.setIdDocente(rs.getInt("idDocente"));
				D.setNombre(rs.getString("nombre"));
				D.setApellido(rs.getString("apellido"));
				D.setTelefono(rs.getString("telefono"));
				D.setEmail(rs.getString("email"));
				D.setContrase�a(rs.getString("contrase�a"));
				D.setEstadoPersona(EstadosPersona.valueOf(rs.getString("estado")));
				
				//Direcion
				Direccion Dir;
				DataDireccion DD = new DataDireccion();;
				Dir = DD.getOne(rs.getInt("idDireccion"));
				if(Dir!=null)
					{D.setDireccion(Dir);}
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
					D.setIdDocente(rs.getInt("idDocente"));
					D.setNombre(rs.getString("nombre"));
					D.setApellido(rs.getString("apellido"));
					D.setTelefono(rs.getString("telefono"));
					D.setEmail(rs.getString("email"));
					D.setContrase�a(rs.getString("contrase�a"));
					D.setEstadoPersona(EstadosPersona.valueOf(rs.getString("estado")));
					
					//Direcion
					Direccion Dir;
					DataDireccion DD = new DataDireccion();;
					Dir = DD.getOne(rs.getInt("idDireccion"));
					if(Dir!=null)
						{D.setDireccion(Dir);}
					
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
	
	public Docente addDocente(String nombre,String apellido,String email, String telefono,int idDireccion, String contrase�a) 
	{
		//Crear nueva Docente
		Docente D = new Docente();
		D.setNombre(nombre);
		D.setApellido(apellido);
		D.setTelefono(telefono);
		D.setEmail(email);
		D.setContrase�a(contrase�a);
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into Docentes(nombre,apellido,email,telefono,idDireccion,contrase�a,estado) values(?,?,?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, D.getNombre());
			stmt.setString(2, D.getApellido());
			stmt.setString(3, D.getEmail());
			stmt.setString(4, D.getTelefono());
			stmt.setInt(5, idDireccion);
			stmt.setString(6, D.getContrase�a());	
			stmt.setString(7, EstadosPersona.Activo.toString());
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
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("UPDATE Docentes SET estado = 'Eliminado' where idDocente = ?");
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
	
	public void setEstate(int id,EstadosPersona estate)
	{
		try {
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("UPDATE Docentes SET estado = ? where idDocente =  ?");
			stmt.setString(1, estate.toString());
			stmt.setInt(2, id);
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
		
	}
	
	public void updateDocente(int idDocente,String nombre,String apellido,String email, String telefono, int idDireccion) {
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("UPDATE Docentes SET nombre = ?,apellido = ?, email = ?,telefono = ?,idDireccion = ? where idDocente = ?");
			stmt.setString(1, nombre);
			stmt.setString(2, apellido);
			stmt.setString(3, email);
			stmt.setString(4, telefono);
			stmt.setInt(5, idDireccion);
			stmt.setInt(6, idDocente);
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
	}
	
	public boolean docenteIsInMateria(int idDocente,int idMateria) {
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select * from Comisiones C inner join Docentes D on C.idDocente = ?");
			stmt.setInt(1, idDocente);
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

	}
}
