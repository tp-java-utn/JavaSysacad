package Data;

import Data.*;
import Entidades.*;
import Entidades.Persona.EstadosPersona;

import java.sql.*;
import java.util.ArrayList;
import java.util.Scanner;

public class DataAlumno {
	
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	public ArrayList<Alumno> getAll()
	{
		ArrayList<Alumno> alumnos= new ArrayList<>();
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select * from Alumnos");
			rs   = stmt.executeQuery();
			if(rs != null)
			{
				while(rs.next())
				{
					//Alumno
					Alumno A = new Alumno();
					A.setApellido(rs.getString("apellido"));
					A.setNombre(rs.getString("Nombre"));
					A.setTelefono(rs.getString("telefono"));
					A.setEmail(rs.getString("email"));
					A.setContraseña(rs.getString("contraseña"));
					A.setLegajo(rs.getString("legajo"));
					A.setEstadoPersona(EstadosPersona.valueOf(rs.getString("estado")));
					
					//Direcion
					Direccion D;
					DataDireccion DD = new DataDireccion();;
					D = DD.getOne(rs.getInt("idDireccion"));
					A.setDireccion(D);
					
					//Agregar a la lista
					alumnos.add(A);
					
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
		
		return alumnos;
	}
	
	public String addAlumno(String nombre, String apellido, String legajo,String telefono,String email,String contraseña,String calle,int numero) {
		
		Alumno A = new Alumno();
		
		try {
		
		//Nuevo alumno
		A.setNombre(nombre);
		A.setApellido(apellido);
		A.setLegajo(legajo);
		A.setTelefono(telefono);
		A.setEmail(email);
		A.setContraseña(contraseña);
		A.setEstadoPersona(EstadosPersona.Pendiente);

	
		//Crear nueva Direccion en caso de que no exista
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select * from Direcciones where calle = ? and numero = ?");
		stmt.setString(1, calle);
		stmt.setInt(2, numero);
		rs   = stmt.executeQuery();
		Direccion D = new Direccion();
		
		if(!rs.isBeforeFirst())
		{
			DataDireccion DD = new DataDireccion();
			D = DD.getOne(DD.addDireccion(calle,numero));
		}
		else
		{
			while(rs.next())
			{
				D.setCalle(rs.getString("calle"));
				D.setNumero(rs.getInt("numero"));
				D.setPiso(rs.getInt("piso"));
				D.setDept(rs.getString("dept"));
				D.setidDireccion(rs.getInt("idDireccion"));
			}
		}
		
		//agregar direccion al alumno
		A.setDireccion(D);
		
		//crear nuevo alumno
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into Alumnos(nombre,apellido,email,telefono,contraseña,legajo,idDireccion,estado) values(?,?,?,?,?,?,?,?)");
		stmt.setString(1, A.getNombre());
		stmt.setString(2, A.getApellido());
		stmt.setString(3, A.getEmail());
		stmt.setString(4, A.getTelefono());
		stmt.setString(5, A.getContraseña());
		stmt.setString(6, A.getLegajo());
		stmt.setInt(7, A.getDireccion().getidDireccion());
		stmt.setString(8, A.getEstadoPersona());
		
		stmt.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return A.getLegajo();
	}
	
	
	public Alumno getOne(String legajo) {
		Alumno A = new Alumno();
		
		try {
			
			//buscar alumno
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select * from Alumnos where legajo = ?");
			stmt.setString(1, legajo);
			rs   = stmt.executeQuery();
			
			if(rs != null) {
				while(rs.next())
				{
					
				//datos generales
				A.setNombre(rs.getString("nombre"));
				A.setApellido(rs.getString("apellido"));
				A.setEmail(rs.getString("email"));
				A.setContraseña(rs.getString("contraseña"));
				A.setLegajo(rs.getString("legajo"));
				A.setTelefono(rs.getString("telefono"));
				A.setEstadoPersona(EstadosPersona.valueOf(rs.getString("estado")));
				
				//direccion
				DataDireccion DD = new DataDireccion();
				Direccion D = new Direccion();
				D = DD.getOne(rs.getInt("idDireccion"));
				A.setDireccion(D);
				
				}
			}
			
			}
			catch (SQLException e) {
				e.printStackTrace();
				
			} finally {
				try {
					if(rs!=null) {rs.close();}
					if(stmt!=null) {stmt.close();}
					FactoryConexion.getInstancia().releaseConn();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return A;
	}
	
	public void delete(String legajo)
	{
		try {
			
			/* baja fisica
			//borrar su direccion
			DataDireccion DD = new DataDireccion();
			DataAlumno DA = new DataAlumno();
			DD.delete(DA.getOne(legajo).getDireccion().getidDireccion());
			
			//borrar Alumno
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("delete from Alumnos where legajo = ?");
			stmt.setString(1, legajo);
			stmt.executeQuery();
			*/
			
			//baja logica
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("UPDATE Alumnos SET estado = 'Eliminado' where legajo =  ?");
			stmt.setString(1, legajo);
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
