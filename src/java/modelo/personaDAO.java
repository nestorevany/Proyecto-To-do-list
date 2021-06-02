package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class personaDAO implements Validar {

     Connection con;
    Conexiones cn = new Conexiones();
    PreparedStatement ps;
    ResultSet rs;
    int r=0;


    public personaDAO() {
        this.cn = new Conexiones();
    }
        
    public int validar(persona per) {
        String sql = "SELECT * FROM persona WHERE nombre=? AND correo=?";
        //int resultado = 0;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, per.getNombre());
            ps.setString(2, per.getCorreo());
            rs = ps.executeQuery();

            while (rs.next()) {
                r=r+1;
                //us.setcodigo_persona(Integer.parseInt(rs.getString(1)));
                per.setNombre(rs.getString("nombre"));
                per.setCorreo(rs.getString("correo"));

            }
           if (r == 1) {
             return 1;
            } else {
               return 0;
            }

        } catch (SQLException e) {
          return 0;
        }

    }

   // public void insertar(Usuario us) throws SQLException {
      //       String sql = "INSERT INTO USUARIOS () VALUES()";
       // int resultado = 0;
         //   con = cn.getConnection();
           // ps = con.prepareStatement(sql);
           // ps.setString(1, us.getCorreo());
            //ps.setString(2, us.getClave());
            //rs = ps.executeQuery();
    

//}

    //@Override
    //public int Validar(persona per) {
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    //}

    @Override
    public int Validar(persona per) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}


