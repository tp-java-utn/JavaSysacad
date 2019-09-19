package Data;

import Entidades.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Scanner;

public class DataMateria {

	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	public Materia getOne(int id) 
	{
		Materia M = new Materia();
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select * from Materias where idMateria=?");
			stmt.setInt(1, id);
			rs   = stmt.executeQuery();
			
			
			if(rs != null) {
				while(rs.next())
				{
				M.setNombre(rs.getString("nombre"));
				M.setdescripcion(rs.getString("descripcion"));
				M.setIdMateria(rs.getInt("idMateria"));
				M.setcursado(rs.getString("cursado"));
				M.setAño(rs.getString("año"));
				M.setCorrelativasAprobadas(rs.getString("correlativasAprobadas"));
				M.setCorrelativasRegulares(rs.getString("correlativasRegulares"));
				M.setCorrelativasRendir(rs.getString("correlativasRendir"));
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
		
		return M;
	}
	
	public ArrayList<Materia> getAll()
	{
		ArrayList<Materia> Materias = new ArrayList<Materia>();
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select * from Materias");
			rs   = stmt.executeQuery();
			if(rs != null)
			{
				while(rs.next())
				{
					Materia M = new Materia();
					M.setNombre(rs.getString("nombre"));
					M.setdescripcion(rs.getString("descripcion"));
					M.setIdMateria(rs.getInt("idMateria"));
					M.setcursado(rs.getString("cursado"));
					M.setAño(rs.getString("año"));
					M.setCorrelativasAprobadas(rs.getString("correlativasAprobadas"));
					M.setCorrelativasRegulares(rs.getString("correlativasRegulares"));
					M.setCorrelativasRendir(rs.getString("correlativasRendir"));
					
					//Agregar a la lista
					Materias.add(M);
					
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
		
		return Materias;
	}
	
	public Materia addMateria(String nombre,String descripcion, String cursado, String año) 
	{
		//Crear nueva Direccion
		int id = 0;
		Materia M = new Materia();
		M.setNombre(nombre);
		M.setdescripcion(descripcion);
		M.setcursado(cursado);
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into Materias(nombre,descripcion,cursado,año,correlativasAprobadas,correlativasRegulares,correlativasRendir) values(?,?,?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, M.getNombre());
			stmt.setString(2, M.getdescripcion());
			stmt.setString(3, M.getcursado());
			stmt.setString(4, M.getAño());
			stmt.setString(5, M.getCorrelativasAprobadas());
			stmt.setString(6, M.getCorrelativasRegulares());
			stmt.setString(7, M.getCorrelativasRendir());
			stmt.executeUpdate();
			
			//id Direccion
			ResultSet keyResultSet=stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()) {
				id=keyResultSet.getInt(1);
				M.setIdMateria(id);
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
		
		return M;
		
	}
	
	public void delete(int idMateria)
	{
		
		try {
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("delete from Materias where idMateria = ?");
			stmt.setInt(1, idMateria);
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
