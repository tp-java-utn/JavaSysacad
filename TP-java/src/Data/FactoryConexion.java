package Data;

import java.sql.*;

public class FactoryConexion {
	
	private static FactoryConexion instancia;
	
	private String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String url    = "jdbc:sqlserver://localhost;";
	private String user   = "UTN_user";
	private String pass   = "hx2su9bb";
	private String db	  = "database=UTN";
	private int conectados=0;
	private Connection conn=null;
	
	private FactoryConexion() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static FactoryConexion getInstancia() {
		if (instancia == null) {
			instancia = new FactoryConexion();
		}
		return instancia;
	}
	
	public Connection getConn() {
		try {
			if(conn==null || conn.isClosed()) {
				conn=DriverManager.getConnection(url+db,user,pass);
				conectados=0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conectados++;
		return conn;
	}
	
	public void releaseConn() {
		conectados--;
		try {
			if (conectados<=0) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
