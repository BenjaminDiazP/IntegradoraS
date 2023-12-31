package com.sigma.sigma.model;

import com.sigma.sigma.utils.MySqlConector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class    LoginDao implements DaoRepository{
    @Override
    //Metodo para encontrar buscar a todos los usuarios dentro de la base de datos
    public List findAll() {
        return null;
    }
// Juan Pedroza
    @Override
    public Object findOne(int id , String rol) { return null;} // modifique esto agre el rol aqui y en el DaoRepository

    public Usuario findOne(String correo, String contra) {
        Usuario usuario = null;
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT * FROM Empleado WHERE Correo = ? AND Contrasenia = SHA2(?, 224)");
            stmt.setString(1, correo);
            stmt.setString(2, contra);
            ResultSet res = stmt.executeQuery();

            if (res.next()) {
                usuario = new Usuario();
                usuario.setId_usuario(res.getInt("id_empleado"));
                usuario.setRol(res.getString("Rol"));
                usuario.setNombre(res.getString("Nombre"));
                usuario.setCorreo(res.getString("Correo"));
                usuario.setDireccion(res.getString("Direccion"));
                usuario.setApellido1(res.getString("Apellido1"));
                usuario.setApellido2(res.getString("Apellido2"));
            } else {
                stmt = con.prepareStatement(
                        "SELECT * FROM Cliente WHERE Correo = ? AND Contrasenia = SHA2(?, 224)");
                stmt.setString(1, correo);
                stmt.setString(2, contra);
                res = stmt.executeQuery();

                if (res.next()) {

                    usuario = new Usuario();
                    usuario.setId_usuario(res.getInt("idcliente"));
                    usuario.setRol(res.getString("Nombre"));
                    usuario.setCorreo(res.getString("Correo"));
                    usuario.setApellido1(res.getString("Apellido1"));
                    usuario.setApellido2(res.getString("Apellido2"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }



    public Object findOne(String correo) {

        return null;
    }



    @Override
    public boolean update(int id, String rol, Object object) {
        return false;
    }

    @Override
    public boolean delete(int id, String rol) {
        return false;
    }
}

