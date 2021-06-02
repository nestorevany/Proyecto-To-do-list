package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class dba {
   // private String base_datos;
    private Connection conexion;
    public Statement query;

 public static void main(String[] args) {
    dba obconeccion=new dba();
    obconeccion.Conectar();
    }
    
    public Connection getConexion() {
        return conexion;
    }

        public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }
    
    public dba Conectar()     
    {
        try{    
            
        Class.forName("oracle.jdbc.OracleDriver");
        String Usuarios = "jdbc:oracle:thin:@localhost:1521:XE";
        conexion= DriverManager.getConnection(Usuarios,"nestoruser","ITbenjamin1");
        query = conexion.createStatement();
       
        
        if(conexion!=null)
        
        {
        System.out.println("Conexion exitosa ");
           }
        else{System.out.println("Conexion fallida");}
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
       
    return this;
    }
    
     public void desconectar(){
        try {
            query.close();
            conexion.close();
            Thread.sleep(1000);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

     public void commit(){
     try{
     conexion.commit();
     }catch(Exception e){
     e.printStackTrace();
     }
     }

    public Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
