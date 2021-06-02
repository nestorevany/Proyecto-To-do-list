package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexiones {

    //constructor
    public Conexiones() {

    }

    private static Connection conn = null;
    private static String login = "nestoruser";
    private static String clave = "ITbenjamin1";
    private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
    public Statement query;

    public Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, login, clave);
            conn.setAutoCommit(false);
            if (conn != null) {
                System.out.println("Exitosa");
            } else {
                System.out.println("fallida");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("conexion fallida");
        }
        return conn;
    }

    public void desconectar() {
        try {
            conn.close();
            
        } catch (SQLException e) {
        }
        System.out.println("fallida desconexion");
    }

    public void commit() {
        try {
            conn.commit();
        } catch (SQLException e) {
            System.out.println("commit fallido");
        }
    }

}
