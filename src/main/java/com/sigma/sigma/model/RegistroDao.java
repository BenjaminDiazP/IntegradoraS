package com.sigma.sigma.model;

import com.sigma.sigma.utils.MySqlConector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RegistroDao implements DaoRepository {

    @Override
    public List findAll() {
        List<Usuario> listaUsuarios = new ArrayList<>();

        return listaUsuarios;
    }

    @Override
    public Object findOne(int id, String ho) {
        return null;
    }

    public Object findOne( String correo, String contra) {
        Usuario usr = new Usuario();
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt =
                    con.prepareStatement("select * from Cliente " +
                            "where Correo = ? AND Contrasenia = sha2(?,224)");
            stmt.setString(1,correo);
            stmt.setString(2,contra);
            ResultSet res = stmt.executeQuery();
            if(res.next()){
                usr.setCorreo(res.getString("Correo"));
                usr.setContrasenia(res.getString("Contrasenia"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usr;
    }


    public Object findOneEmpleado( String correo, String contra) {
        Usuario usr = new Usuario();
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt =
                    con.prepareStatement("select * from Empleado " +
                            "where Correo = ? AND Contrasenia = sha2(?,224)");
            stmt.setString(1,correo);
            stmt.setString(2,contra);
            ResultSet res = stmt.executeQuery();
            if(res.next()){
                usr.setCorreo(res.getString("Correo"));
                usr.setContrasenia(res.getString("Contrasenia"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usr;
    }

    @Override
    public boolean update(int id, String hola,Object object) {
        return false;
    }

    @Override
    public boolean delete(int id, String hola) {
        return false;
    }

    public boolean insertCliente( Usuario usr ){
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "insert into Cliente(Nombre, Apellido1, Apellido2,Rfc, Curp, Direccion, Sexo, NoTelefono, Correo,FechaNac, Codigo,Contrasenia)"+
                            "values(?,?,?,?,?,?,?,?,?,?,sha2(?,224),sha2(?,224))"
            );
            stmt.setString(1,usr.getNombre());
            stmt.setString(2,usr.getApellido1());
            stmt.setString(3,usr.getApellido2());
            stmt.setString(4,usr.getRfc());
            stmt.setString(5,usr.getCurp());
            stmt.setString(6,usr.getDireccion());
            stmt.setString(7,usr.getSexo());
            stmt.setString(8,usr.getNoTelefono());
            stmt.setString(9,usr.getCorreo());
            stmt.setString(10,usr.getFechaNac());
            stmt.setString(11,usr.getCodigo());
            stmt.setString(12,usr.getContrasenia());



            if(stmt.executeUpdate() > 0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean insertEmpleado( Usuario usr ){
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "insert into Empleado(Rol, Nombre, Apellido1, Apellido2,Rfc, Curp, Direccion, Sexo, NoTelefono, Correo,FechaNac,Contrasenia, Codigo)"+
                            "values(?,?,?,?,?,?,?,?,?,?,?,sha2(?,224),sha2(?,224))"
            );
            stmt.setString(1, usr.getRol());
            stmt.setString(2,usr.getNombre());
            stmt.setString(3,usr.getApellido1());
            stmt.setString(4,usr.getApellido2());
            stmt.setString(5,usr.getRfc());
            stmt.setString(6,usr.getCurp());
            stmt.setString(7,usr.getDireccion());
            stmt.setString(8,usr.getSexo());
            stmt.setString(9,usr.getNoTelefono());
            stmt.setString(10,usr.getCorreo());
            stmt.setString(11,usr.getFechaNac());
            stmt.setString(12,usr.getContrasenia());
            stmt.setString(13,usr.getCodigo());




            if(stmt.executeUpdate() > 0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }



    public Object findOne(String correo) {
        return null;
        }

    }


