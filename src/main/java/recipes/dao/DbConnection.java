package recipes.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import projects.exception.DbException;

public class DbConnection {
	
	private static final String SCHEMA = "recipes";
	private static final String USER = "recipes";
	private static final String PASSWORD = "recipes";
	private static final String HOST = "localhost";
	private static final int PORT = 3306;
	
	  public static Connection getConnection() {
		    String uri = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s", HOST, PORT, SCHEMA,
		        USER, PASSWORD);

		    try {
		      Connection conn = DriverManager.getConnection(uri);
		      System.out.println("Connection to schema '" + SCHEMA + "' is successful.");
		      return conn;
		    } catch (SQLException e) {
		      System.out.println("Unable to get connection at " + uri);
		      throw new DbException("Unable to get connection at \" + uri");
		    }
		  
	
	//public static Connection getConnection() {
		//String url = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s&useSSL=false", HOST, PORT, SCHEMA, USER, PASSWORD);
		//Connection conn = DriverManager.getConnection(url);
		//System.out.println("Connection Successful");
		//return conn;
	  }
	
}
