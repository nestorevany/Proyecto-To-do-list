package modelo;

import java.sql.*;
import java.util.*;
import java.io.*;


public class JOConnection {
    public static Connection conn;
    public static Statement stmt;
    public static ResultSet rslt;


public static void JConnect() throws  ClassNotFoundException, SQLException {

String username ="nestoruser"; 
String password ="ITbenjamin1"; 

Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",username,password);
stmt = conn.createStatement();


}
}

