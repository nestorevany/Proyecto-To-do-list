package modelo;


public class persona{

int codigo_persona;
String nombre;
String correo;

public persona(){    
}
  public persona(int codigo_persona, String nombre, String correo){
      this.codigo_persona=codigo_persona;
      this.nombre=nombre;
      this.correo=correo;
      
  }

    public int getCodigo_persona() {
        return codigo_persona;
    }

    public void setCodigo_persona(int codigo_persona) {
        this.codigo_persona = codigo_persona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

}

