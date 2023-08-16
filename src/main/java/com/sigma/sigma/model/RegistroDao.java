package com.sigma.sigma.model;

import com.sigma.sigma.utils.MySqlConector;
import com.sigma.sigma.utils.SendEmail;

import java.io.File;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

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

    public Object findOne(String correo, String contra) {
        Usuario usr = new Usuario();
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt =
                    con.prepareStatement("select * from Cliente " +
                            "where Correo = ? AND Contrasenia = sha2(?,224)");
            stmt.setString(1, correo);
            stmt.setString(2, contra);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                usr.setCorreo(res.getString("Correo"));
                usr.setContrasenia(res.getString("Contrasenia"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usr;
    }


    public Object findOneEmpleado(String correo, String contra) {
        Usuario usr = new Usuario();
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt =
                    con.prepareStatement("select * from Empleado " +
                            "where Correo = ? AND Contrasenia = sha2(?,224)");
            stmt.setString(1, correo);
            stmt.setString(2, contra);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                usr.setCorreo(res.getString("Correo"));
                usr.setContrasenia(res.getString("Contrasenia"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usr;
    }

    @Override
    public boolean update(int id, String hola, Object object) {
        return false;
    }

    @Override
    public boolean delete(int id, String hola) {
        return false;
    }

    public boolean insertCliente(Usuario usr) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "insert into Cliente(Nombre, Apellido1, Apellido2,Rfc, Curp, Direccion, Sexo, NoTelefono, Correo,FechaNac,Contrasenia, Codigo,Estado)" +
                            "values(?,?,?,?,?,?,?,?,?,?,sha2(?,224),sha2(?,224),?)"
            );
            stmt.setString(1, usr.getNombre());
            stmt.setString(2, usr.getApellido1());
            stmt.setString(3, usr.getApellido2());
            stmt.setString(4, usr.getRfc());
            stmt.setString(5, usr.getCurp());
            stmt.setString(6, usr.getDireccion());
            stmt.setString(7, usr.getSexo());
            stmt.setString(8, usr.getNoTelefono());
            stmt.setString(9, usr.getCorreo());
            stmt.setString(10, usr.getFechaNac());
            stmt.setString(12, usr.getCodigo());
            stmt.setString(11, usr.getContrasenia());
            stmt.setInt(13, 1);

            if (stmt.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Imprime el error en la consola para que puedas verlo
        } finally {
            // Cerrar la conexión en el bloque finally
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean insertEmpleado(Usuario usr) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "insert into Empleado(Rol, Nombre, Apellido1, Apellido2,Rfc, Curp, Direccion, Sexo, NoTelefono, Correo,FechaNac,Contrasenia, Codigo,Estado)" +
                            "values(?,?,?,?,?,?,?,?,?,?,?,sha2(?,224),sha2(?,224),?)"
            );
            stmt.setString(1, usr.getRol());
            stmt.setString(2, usr.getNombre());
            stmt.setString(3, usr.getApellido1());
            stmt.setString(4, usr.getApellido2());
            stmt.setString(5, usr.getRfc());
            stmt.setString(6, usr.getCurp());
            stmt.setString(7, usr.getDireccion());
            stmt.setString(8, usr.getSexo());
            stmt.setString(9, usr.getNoTelefono());
            stmt.setString(10, usr.getCorreo());
            stmt.setString(11, usr.getFechaNac());
            stmt.setString(12, usr.getContrasenia());
            stmt.setString(13, usr.getCodigo());
            stmt.setInt(14, 1);

            if (stmt.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Imprime el error en la consola para que puedas verlo
        } finally {
            // Cerrar la conexión en el bloque finally
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public List getAllEmpleado() {
        List<Usuario> listaEmpleado = new ArrayList<>();
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT *FROM Empleado"
            );
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Usuario usr = new Usuario();
                int randomNum = ThreadLocalRandom.current().nextInt(1000, 10000);
                usr.setIdentificador(randomNum);
                usr.setId_usuario(res.getInt(1));
                usr.setNombre(res.getString("nombre"));
                usr.setApellido1(res.getString("apellido1"));
                usr.setApellido2(res.getString("apellido2"));
                usr.setCurp(res.getString("Curp"));
                usr.setRfc(res.getString("Rfc"));
                usr.setFechaNac(res.getString("FechaNac"));
                usr.setSexo(res.getString("Sexo"));
                usr.setDireccion(res.getString("Direccion"));
                usr.setCorreo(res.getString("Correo"));
                usr.setNoTelefono(res.getString("NoTelefono"));
                usr.setRol(res.getString("Rol"));
                usr.setEstado(res.getInt("Estado"));
                /*
                art.setIdentificador(randomNum);
                art.setId_producto(res.getInt(1));
                art.setNombre(res.getString("nombre"));
                art.setCosto(res.getDouble("costo"));
                art.setCategoria(res.getString("categoria"));
                art.setStock(res.getInt("stock"));
*/
                listaEmpleado.add(usr);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEmpleado;

    }

    public List getAllCliente() {
        List<Usuario> listaCliente = new ArrayList<>();
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT *FROM Cliente"
            );
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Usuario usr = new Usuario();
                int randomNum = ThreadLocalRandom.current().nextInt(1000, 10000);
                usr.setIdentificador(randomNum);
                usr.setId_usuario(res.getInt("idcliente"));
                usr.setNombre(res.getString("nombre"));
                usr.setApellido1(res.getString("apellido1"));
                usr.setApellido2(res.getString("apellido2"));
                usr.setCurp(res.getString("Curp"));
                usr.setRfc(res.getString("Rfc"));
                usr.setFechaNac(res.getString("FechaNac"));
                usr.setSexo(res.getString("Sexo"));
                usr.setDireccion(res.getString("Direccion"));
                usr.setCorreo(res.getString("Correo"));
                usr.setNoTelefono(res.getString("NoTelefono"));
                usr.setEstado(res.getInt("Estado"));

                listaCliente.add(usr);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaCliente;

    }

    //EMPLEADO
    public boolean ModificarEmpleado(Usuario usr) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Empleado SET Nombre = ? , Apellido1 = ? , Apellido2 = ? , Direccion = ? , Sexo = ? , NoTelefono = ? , Correo = ? , Rol = ? WHERE Rfc = ?"
            );
            stmt.setString(1, usr.getNombre());
            stmt.setString(2, usr.getApellido1());
            stmt.setString(3, usr.getApellido2());
            stmt.setString(4, usr.getDireccion());
            stmt.setString(5, usr.getSexo());
            stmt.setString(6, usr.getNoTelefono());
            stmt.setString(7, usr.getCorreo());
            stmt.setString(8, usr.getRol());
            stmt.setString(9, usr.getRfc());

            if (stmt.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("cacho en el error de sql");
            throw new RuntimeException(e);

        }

        return false;
    }

    //Estado del Empleado
    public boolean CambiarEstadoE(String rfc) {
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Empleado SET Estado=0 WHERE Rfc=?");
            stmt.setString(1, rfc);

            // Ejecutar la consulta de actualización
            int filasActualizadas = stmt.executeUpdate();

            // Si la consulta se ejecutó con éxito y actualizó al menos una fila, devolver true
            return filasActualizadas > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error al actualizar el artículo", e);
        } finally {
            // Cerrar la conexión y liberar recursos
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejar el error al cerrar la conexión (opcional)
                e.printStackTrace();
            }
        }
    }

    public int BuscarEstadoEmpleado(String rfc) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT Estado from Empleado where Rfc = ?"
            );
            stmt.setString(1, rfc);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                int estado = res.getInt("estado");
                return estado;
            } else {
                throw new RuntimeException("No se encontró ningún registro con el ID proporcionado.");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al buscar el estado: " + e.getMessage(), e);
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean CambiarEstadoEmpleado1(String rfc) {
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Empleado SET Estado=1 WHERE Rfc=?");
            stmt.setString(1, rfc);

            // Ejecutar la consulta de actualización
            int filasActualizadas = stmt.executeUpdate();

            // Si la consulta se ejecutó con éxito y actualizó al menos una fila, devolver true
            return filasActualizadas > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error al actualizar el artículo", e);
        } finally {
            // Cerrar la conexión y liberar recursos
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejar el error al cerrar la conexión (opcional)
                e.printStackTrace();
            }
        }
    }


    //CLIENTE
    public boolean ModificarCliente(Usuario usr) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Cliente SET Nombre = ? , Apellido1 = ? , Apellido2 = ? , Direccion = ? , Sexo = ? , NoTelefono = ? , Correo = ? WHERE Rfc = ?"
            );
            stmt.setString(1, usr.getNombre());
            stmt.setString(2, usr.getApellido1());
            stmt.setString(3, usr.getApellido2());
            stmt.setString(4, usr.getDireccion());
            stmt.setString(5, usr.getSexo());
            stmt.setString(6, usr.getNoTelefono());
            stmt.setString(7, usr.getCorreo());
            stmt.setString(8, usr.getRfc());

            if (stmt.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("cacho en el error de sql cliente");
            throw new RuntimeException(e);
        }

        return false;
    }

    //Estado Cliente
    public boolean CambiarEstadoC(String rfc) {
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Cliente SET Estado=0 WHERE Rfc=?");
            stmt.setString(1, rfc);

            // Ejecutar la consulta de actualización
            int filasActualizadas = stmt.executeUpdate();

            // Si la consulta se ejecutó con éxito y actualizó al menos una fila, devolver true
            return filasActualizadas > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error al actualizar el artículo", e);
        } finally {
            // Cerrar la conexión y liberar recursos
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejar el error al cerrar la conexión (opcional)
                e.printStackTrace();
            }
        }
    }

    public int BuscarEstadoCliente(String rfc) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT Estado from Cliente where Rfc = ?"
            );
            stmt.setString(1, rfc);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                int estado = res.getInt("estado");
                return estado;
            } else {
                throw new RuntimeException("No se encontró ningún registro con el ID proporcionado.");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al buscar el estado: " + e.getMessage(), e);
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean CambiarEstadoCleinte1(String rfc) {
        MySqlConector conector = new MySqlConector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Cliente SET Estado=1 WHERE Rfc=?");
            stmt.setString(1, rfc);

            // Ejecutar la consulta de actualización
            int filasActualizadas = stmt.executeUpdate();

            // Si la consulta se ejecutó con éxito y actualizó al menos una fila, devolver true
            return filasActualizadas > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error al actualizar el artículo", e);
        } finally {
            // Cerrar la conexión y liberar recursos
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejar el error al cerrar la conexión (opcional)
                e.printStackTrace();
            }
        }
    }


    public int getUltimoIdCliente() {
        int ultimoId = 0;
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();

        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT idcliente FROM Cliente ORDER BY idcliente DESC LIMIT 1"
            );

            ResultSet res = stmt.executeQuery();

            if (res.next()) {
                ultimoId = res.getInt("idcliente");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return ultimoId;
    }


    //Cambio de contrasena para empleados empieza aqui sin que sepan su contrasenia

    public String ObtenerCodigoRestablecimientoEmpleado(String correo) {
        String codigoRestablecimiento = null;
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT Codigo FROM Empleado WHERE Correo = ?"
            );

            stmt.setString(1, correo);
            ResultSet res = stmt.executeQuery();

            if (res.next()) {
                codigoRestablecimiento = res.getString("Codigo");
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el codigo de restablecimiento: " + e.getMessage());
        }

        return codigoRestablecimiento;
    }


    public String generadorCodigoEmpleado() {
        String caracteresPermitidos = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        int longitudCadena = 40;
        StringBuilder cadenaAleatoria = new StringBuilder();

        Random random = new Random();

        for (int i = 0; i < longitudCadena; i++) {
            int indiceAleatorio = random.nextInt(caracteresPermitidos.length());
            char caracterAleatorio = caracteresPermitidos.charAt(indiceAleatorio);
            cadenaAleatoria.append(caracterAleatorio);
        }
        return cadenaAleatoria.toString();
    }

    public Void UpdateCodigoEmpleado(String correo, String nuevocodigo) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Empleado SET Codigo = ? WHERE Correo = ?"
            );
            stmt.setString(1, nuevocodigo);
            stmt.setString(2, correo);

            if (stmt.executeUpdate() > 0) {
                System.out.println("Codigo Actualizado");
            }
        } catch (SQLException e) {
            System.out.println("cacho en el error de sql al querer actualizar el codigo en empleado");
            throw new RuntimeException(e);

        }
        return null;
    }

    //Actualizar contrasena desde el inicio de sesion para empleados
    public boolean UpdateContraseniaEmpleado(String correo, String nuevacontrasenia) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Empleado SET Contrasenia = sha2(?,224) WHERE Correo = ?"
            );
            stmt.setString(1, nuevacontrasenia);
            stmt.setString(2, correo);


            if (stmt.executeUpdate() > 0) {
                System.out.println("Contrasena Actualizada");
                return true;
            }else {
                System.out.println("contra no actualizada");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("cacho en el error de sql");
            throw new RuntimeException(e);

        }

    }

    //Recuperar contrasenia (Ver si el correo que ingreso existe)
    public  boolean BuscarCorreoEmpleado(String correo){
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT Correo FROM Empleado WHERE Correo =?"
            );
            stmt.setString(1,correo);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                System.out.println("Correo encontrado en la base de datos");
                return true;
            }else {
                System.out.println("Correo no encontrado en la base de datos");
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                con.close();
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }


    //Enviar correo con codigo para reestablecer
    public void  EnviarCodigoPorCorreo(String correo, String codigorestablecimeinto){
        String asunto = "Restablecimiento de contraseñia";
        String mensaje = "Hola, \n\n";
        mensaje += "Hemos recibido una solicitud para reestablecer la contraseñia de tu cuenta. ";
        mensaje += "Ingresa el siguiente codigo  en el formulario para completar el proceso: \n\n";
        mensaje += codigorestablecimeinto + "\n\n";
        mensaje += "Si no solicitaste este reestablecimiento, Verifica la seguridad de tu cuenta. \n\n";
        mensaje += "Gracias.";

        SendEmail newmail = new SendEmail();
        newmail.sendEmail(correo,asunto,mensaje);

    }
    // termina aqui el recuperar contrasenia para empleados sin que sepan su contresenia


    // cambiar contrasenia para clientes sins saberse su contrasenia














    //cambiar contrasenia empleados sabiendose su contrasenia // CC = Con Contrasenia
    public boolean UpdateContraseniaEmpleadoCC(String correo, String nuevacontrasenia) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Empleado SET Contrasenia = sha2(?,224) WHERE Correo = ?"
            );
            stmt.setString(1, nuevacontrasenia);
            stmt.setString(2, correo);


            if (stmt.executeUpdate() > 0) {
                System.out.println("Contrasena Actualizada");
                return true;
            }else {
                System.out.println("contra no actualizada");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("cacho en el error de sql");
            throw new RuntimeException(e);

        }

    }

    //cambiar contrasenia clientes sabiendose su contrasenia // CC = Con Contrasenia
    public boolean UpdateContraseniaCleinteCC(String correo, String nuevacontrasenia) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Cliente SET Contrasenia = sha2(?,224) WHERE Correo = ?"
            );
            stmt.setString(1, nuevacontrasenia);
            stmt.setString(2, correo);


            if (stmt.executeUpdate() > 0) {
                System.out.println("Contrasena Actualizada");
                return true;
            }else {
                System.out.println("contra no actualizada");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("cacho en el error de sql");
            throw new RuntimeException(e);

        }

    }

    //Cambiar correo Empleado
    public boolean UpdateCorreoEmpleado(int empleadoId, String nuevoCorreo) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Empleado SET Correo = ? WHERE id_empleado = ?"
            );
            stmt.setString(1, nuevoCorreo);
            stmt.setInt(2, empleadoId);

            if (stmt.executeUpdate() > 0) {
                System.out.println("Correo de empleado actualizado");
                return true;
            } else {
                System.out.println("Correo de empleado no actualizado");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error al ejecutar la consulta SQL");
            throw new RuntimeException(e);
        }
    }



    //Cambiar correo Cliente
    public boolean UpdateCorreoCliente(int clienteId, String nuevoCorreo) {
        MySqlConector connection = new MySqlConector();
        Connection con = connection.connect();
        try {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Cliente SET Correo = ? WHERE idcliente = ?"
            );
            stmt.setString(1, nuevoCorreo);
            stmt.setInt(2, clienteId);

            if (stmt.executeUpdate() > 0) {
                System.out.println("Correo de cliente actualizado");
                return true;
            } else {
                System.out.println("Correo de cliente no actualizado");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error al ejecutar la consulta SQL");
            throw new RuntimeException(e);
        }
    }




}



