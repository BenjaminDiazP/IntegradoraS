package com.sigma.sigma.model;


public class Usuario {
    private int id_usuario;
    private String rol; // esto modifique
    private String nombre;
    private String apellido1;
    private String apellido2;
    private String rfc;
    private String curp;
    private String direccion;
    private String sexo;
    private String noTelefono;
    private String correo;
    private String fechaNac;
    private String contrasenia;
    private String codigo;
    private int identificador;

    public Usuario( String nombre, String apellido1, String apellido2, String rfc, String curp, String direccion, String sexo, String noTelefono, String correo, String fechaNac, String contrasenia, String codigo,int identificador) {this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.rfc = rfc;
        this.curp = curp;
        this.direccion = direccion;
        this.sexo = sexo;
        this.noTelefono = noTelefono;
        this.correo = correo;
        this.fechaNac = fechaNac;
        this.contrasenia = contrasenia;
        this.codigo = codigo;
        this.identificador = identificador;

    }


    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getRol() {
        return rol;
    } //esto modifique

    public void setRol(String rol) {
        this.rol = rol;
    } // esto modifique

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getNoTelefono() {
        return noTelefono;
    }

    public void setNoTelefono(String noTelefono) {
        this.noTelefono = noTelefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getContrasenia() {return contrasenia;}

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public Usuario(int id_usuario, String rol, String nombre, String apellido1, String apellido2, String rfc, String curp, String direccion, String sexo, String noTelefono, String correo, String fechaNac, String contrasenia, String codgio) {

    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }

    public Usuario(String rol, String nombre, String apellido1, String apellido2, String rfc, String curp, String direccion, String sexo, String noTelefono, String correo, String fechaNac, String contrasenia, String codigo,int identificador) {
        this.rol = rol;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.rfc = rfc;
        this.curp = curp;
        this.direccion = direccion;
        this.sexo = sexo;
        this.noTelefono = noTelefono;
        this.correo = correo;
        this.fechaNac = fechaNac;
        this.codigo = codigo;
        this.contrasenia = contrasenia;
        this.identificador = identificador;

    }
    public Usuario(String rol, String nombre, String apellido1, String apellido2, String rfc, String curp, String direccion, String sexo, String noTelefono, String correo, String fechaNac, String contrasenia, String codigo) {
        this.rol = rol;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.rfc = rfc;
        this.curp = curp;
        this.direccion = direccion;
        this.sexo = sexo;
        this.noTelefono = noTelefono;
        this.correo = correo;
        this.fechaNac = fechaNac;
        this.codigo = codigo;
        this.contrasenia = contrasenia;
    }

    public Usuario(String nombre, String apellido1, String apellido2, String rfc, String curp, String direccion, String sexo, String noTelefono, String correo, String fechaNac, String contrasenia, String codigo) {
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.rfc = rfc;
        this.curp = curp;
        this.direccion = direccion;
        this.sexo = sexo;
        this.noTelefono = noTelefono;
        this.correo = correo;
        this.fechaNac = fechaNac;
        this.codigo = codigo;
        this.contrasenia = contrasenia;
    }


    public Usuario(){

    }



}
