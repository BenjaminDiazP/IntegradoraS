package com.sigma.sigma.model;

import com.sigma.sigma.utils.MySqlConector;

import javax.sql.rowset.serial.SerialArray;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;


public class MantenimientoDao implements DaoRepository {

    @Override

    public List findAll() {
        return null;
    }

    @Override
    public Object findOne(int id, String rol) {
        return null;
    }

    public Usuario findOne(String correo, String contra) {

        return null;
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

    public Mantenimiento realizarBusquedaEnLaBaseDeDatos(String query) {
        MySqlConector conector = new MySqlConector();
        Mantenimiento man = new Mantenimiento();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT C.Nombre, C.Correo, C.Apellido1,C.Apellido2, V.Placas, V.Marca FROM Cliente C JOIN Vehiculo V on C.idcliente = V.id_cliente  WHERE C.Correo= ?");
            stmt.setString(1, query.trim());
            ResultSet res = stmt.executeQuery();

            if (res.next()) {
                man.setNombreCliente(res.getString("C.Nombre"));
                man.setCorreo(res.getString("C.Correo"));
                man.setPlacas(res.getString("V.Placas"));
                man.setMarca(res.getString("V.Marca"));
                man.setApellido1(res.getString("C.Apellido1"));
                man.setApellido2(res.getString("C.Apellido2"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return man;
    }

    public List obtenerMecanicos() {
        List<Usuario> mecanicosList = new ArrayList<>();

        MySqlConector conector = new MySqlConector();

        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT * from Empleado  WHERE Rol = 'Mecanico'");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Usuario usr = new Usuario();
                usr.setNombre(res.getString("Nombre"));
                usr.setApellido1(res.getString("Apellido1"));
                usr.setApellido2(res.getString("Apellido2"));
                usr.setId_usuario(res.getInt("id_empleado"));
                usr.setCorreo(res.getString("Correo"));

                mecanicosList.add(usr);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return mecanicosList;
    }

    public List<String> obtenerPaquetesDesdeBD(String categoria) {
        List<String> nombre = new ArrayList<>();

        MySqlConector conector = new MySqlConector();

        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT Nombre FROM Paquete WHERE Categoria = ?");
            stmt.setString(1, categoria);
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                String nombreP = res.getString("Nombre");
                nombre.add(nombreP);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nombre;
    }

    public boolean insertarMantenimiento(Mantenimiento mantenimiento) {
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "INSERT INTO Mantenimiento (NoSerie, id_empleado, id_paquete, Categoria, FechaInicio, FechaFin, Proceso, Total, Descripcion)" +
                            "VALUES(?,?,?,?,?,?,?,?,?) "
            );

            stmt.setString(1, mantenimiento.getNoSerie());
            stmt.setInt(2, mantenimiento.getId_mecanico());
            stmt.setInt(3, mantenimiento.getId_paquete());
            stmt.setString(4, mantenimiento.getCategoria());
            stmt.setString(5, mantenimiento.getFechaInicio());
            stmt.setString(6, mantenimiento.getFechaFin());
            stmt.setInt(7, mantenimiento.getProceso());
            stmt.setFloat(8, mantenimiento.getTotal());
            stmt.setString(9, mantenimiento.getDescripcion());
            int filasAfectadas = stmt.executeUpdate();

            if (filasAfectadas > 0) {
                return true;

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public int buscarIdPaquete(String nombre) {
        MySqlConector conector = new MySqlConector();
        int idPaquete = -1;
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id_paquete from Paquete WHERE Nombre= ?"
            );
            stmt.setString(1, nombre);

            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                idPaquete = res.getInt("id_paquete");
                return idPaquete;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return idPaquete;
    }


    public String buscarNoSerie(String correo) {
        MySqlConector conector = new MySqlConector();
        String noSerie = "";
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT V.NoSerie as NumeroSerie from Vehiculo V JOIN Cliente C on  C.idcliente = V.id_cliente  WHERE C.Correo = ?"
            );
            stmt.setString(1, correo.trim());
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                noSerie = res.getString("NumeroSerie");
                return noSerie;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return noSerie;
    }

    public double obtenerPrecioDesdeBD(String paquete) {
        double precio = 0.0;
        MySqlConector conector = new MySqlConector();

        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT Costo from Paquete where Nombre = ?"
            );
            stmt.setString(1, paquete);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                precio = res.getDouble("Costo");
                return precio;
            }

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return precio;
    }


    public List mostrarMantenimiento(int id) {
        MySqlConector conector = new MySqlConector();
        List<Mantenimiento> listMantenimiento = new ArrayList<>();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT\n" +
                            "    M.id_empleado,\n" +
                            "    P.Costo,\n" +
                            "    V.Imagen,\n" +
                            "    V.Marca,\n" +
                            "    M.id_mantenimiento,\n" +
                            "    M.Proceso,\n" +
                            "    M.Categoria,\n" +
                            "    M.Descripcion,\n" +
                            "    V.id_cliente,\n" +
                            "    M.NoSerie,\n" +
                            "    M.FechaInicio,\n" +
                            "    C.Nombre,\n" +
                            "    C.Apellido1,\n" +
                            "    C.Apellido2,\n" +
                            "    P.Nombre AS nombre_paquete,\n" +
                            "    COUNT(E.id_producto) AS cantidad_productos_extra\n" +
                            "FROM\n" +
                            "    Cliente C\n" +
                            "JOIN\n" +
                            "    Vehiculo V ON V.id_cliente = C.idcliente\n" +
                            "JOIN\n" +
                            "    Mantenimiento M ON V.NoSerie = M.NoSerie\n" +
                            "JOIN\n" +
                            "    Paquete P ON P.id_paquete = M.id_paquete\n" +
                            "LEFT JOIN\n" +
                            "    Extra E ON M.id_mantenimiento = E.id_mantenimiento\n" +
                            "WHERE\n" +
                            "    M.id_empleado=?\n" +
                            "GROUP BY\n" +
                            "    M.id_empleado,\n" +
                            "    V.Imagen,\n" +
                            "    V.Marca,\n" +
                            "    M.id_mantenimiento,\n" +
                            "    M.Proceso,\n" +
                            "    M.Categoria,\n" +
                            "    M.Descripcion,\n" +
                            "    V.id_cliente,\n" +
                            "    M.NoSerie,\n" +
                            "    M.FechaInicio,\n" +
                            "    C.Nombre,\n" +
                            "    C.Apellido1,\n" +
                            "    C.Apellido2,\n" +
                            "    P.Nombre;");
            stmt.setInt(1, id);
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Mantenimiento man = new Mantenimiento();
                man.setNoSerie(res.getString("M.NoSerie"));
                man.setFechaInicio(res.getString("M.FechaInicio"));
                man.setNombrePaquete(res.getString("nombre_paquete"));
                man.setNombreCliente(res.getString("C.Nombre"));
                man.setDescripcion(res.getString("M.Descripcion"));
                man.setCategoria(res.getString("M.Categoria"));
                man.setId_mecanico(res.getInt("M.id_empleado"));
                man.setId_mantenimiento(res.getInt("M.id_mantenimiento"));
                man.setProceso(res.getInt("M.Proceso"));
                man.setApellido1(res.getString("C.Apellido1"));
                man.setApellido2(res.getString("C.Apellido2"));
                man.setMarca(res.getString("V.Marca"));
                man.setExtras(res.getInt("cantidad_productos_extra"));
                listMantenimiento.add(man);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listMantenimiento;
    }

    public List oneMantenimiento(int id) {

        MySqlConector conector = new MySqlConector();
        List<Mantenimiento> listMantenimiento = new ArrayList<>();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("" +
                    "SELECT V.Imagen, M.*, C.Nombre, C.Apellido1, C.Apellido2, P.Nombre as nombreP from Cliente C  JOIN Vehiculo V on V.id_cliente = C.idcliente JOIN Mantenimiento M on V.NoSerie = M.noSerie JOIN Paquete P " +
                    " on P.Id_paquete = M.id_paquete  where M.id_mantenimiento = ?");

            stmt.setInt(1, id);
            ResultSet res = stmt.executeQuery();

            while (res.next()) {
                Mantenimiento man = new Mantenimiento();
                man.setNoSerie(res.getString("NoSerie"));
                man.setFechaInicio(res.getString("FechaInicio"));
                man.setNombrePaquete(res.getString("nombreP"));
                man.setNombreCliente(res.getString("C.Nombre"));
                man.setDescripcion(res.getString("descripcion"));
                man.setCategoria(res.getString("Categoria"));
                man.setId_mecanico(res.getInt("id_empleado"));
                man.setId_mantenimiento(res.getInt("id_mantenimiento"));
                listMantenimiento.add(man);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listMantenimiento;
    }

    public void agregarArticulosAMantenimiento(int idMantenimiento, String[] nombresArticulos) {
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO Extra (id_mantenimiento, id_producto) VALUES (?,?)");

            for (String nombreArticulo : nombresArticulos) {

                int idProducto = buscarIdxNombre(nombreArticulo);

                stmt.setInt(1, idMantenimiento);
                stmt.setInt(2, idProducto);

                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int buscarIdxNombre(String nombre) {
        MySqlConector conector = new MySqlConector();
        int nombreA = -1;
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT id_producto FROM Producto where Nombre =?");
            stmt.setString(1, nombre.trim());
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                nombreA = res.getInt("id_producto");
                return nombreA;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nombreA;
    }

    public List<Articulo> obtenerDetallesArticulos(int id_mantenimiento) {

        List<Articulo> detalles = new ArrayList<>();
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT P.* FROM Producto P JOIN Extra E on E.id_producto =" +
                    " P.id_producto JOIN Mantenimiento M on M.id_mantenimiento = E. id_mantenimiento where M.id_mantenimiento = ?");
            stmt.setInt(1, id_mantenimiento);
            ResultSet res = stmt.executeQuery();

            while (res.next()) {
                Articulo art = new Articulo();
                art.setNombre(res.getString("Nombre"));
                art.setCategoria(res.getString("Categoria"));
                art.setCosto(res.getFloat("Costo"));
                detalles.add(art);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return detalles;
    }

    public void actualizarProceso(int id_manetenimiento, int porcentaje) {
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("UPDATE Mantenimiento SET Proceso = ? WHERE id_mantenimiento = ?");
            stmt.setInt(1, porcentaje);
            stmt.setInt(2, id_manetenimiento);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int obtenerPorcenje(int id_manetenimiento) {
        int porcentaje = -1;
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT Proceso FROM Mantenimiento WHERE id_mantenimiento = ?");
            stmt.setInt(1, id_manetenimiento);
            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                porcentaje = resultSet.getInt("Proceso");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return porcentaje;
    }
    public String  buscarCorreoCliente(int id) {
        String correo ="";
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT C.Correo FROM Cliente C join Vehiculo V on V.id_cliente = C.idcliente JOIN Mantenimiento M on M.NoSerie = V.NoSerie where M.id_mantenimiento = ?");
            stmt.setInt(1, id);
            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                correo = resultSet.getString("C.Correo");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return correo;
    }

    public List<ProductoExtra> obtenerProductosExtraPorMantenimiento(int idMantenimiento) {
        List<ProductoExtra> listaProductosExtra = new ArrayList<>();
        MySqlConector conector = new MySqlConector();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT P.Nombre, P.Costo FROM Producto P JOIN Extra E ON P.id_producto = E.id_producto WHERE E.id_mantenimiento = ?");
            stmt.setInt(1, idMantenimiento);
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                ProductoExtra productoExtra = new ProductoExtra();
                productoExtra.setNombre(res.getString("P.Nombre"));
                productoExtra.setPrecio(res.getDouble("P.Costo"));
                listaProductosExtra.add(productoExtra);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaProductosExtra;
    }


    public List MostrarMantenimientosTotales() {
        MySqlConector conector = new MySqlConector();
        List<Mantenimiento> listMantenimientosTotales = new ArrayList<>();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT\n" +
                            "    M.id_empleado,\n" +
                            "    P.Costo,\n" +
                            "    V.Imagen,\n" +
                            "    V.Marca,\n" +
                            "    M.id_mantenimiento,\n" +
                            "    M.Proceso,\n" +
                            "    M.Categoria,\n" +
                            "    M.Descripcion,\n" +
                            "    V.id_cliente,\n" +
                            "    M.NoSerie,\n" +
                            "    M.FechaInicio,\n" +
                            "    C.Nombre,\n" +
                            "    C.Apellido1,\n" +
                            "    C.Apellido2,\n" +
                            "    P.Nombre AS nombre_paquete,\n" +
                            "    COUNT(E.id_producto) AS cantidad_productos_extra\n" +
                            "FROM\n" +
                            "    Cliente C\n" +
                            "JOIN\n" +
                            "    Vehiculo V ON V.id_cliente = C.idcliente\n" +
                            "JOIN\n" +
                            "    Mantenimiento M ON V.NoSerie = M.NoSerie\n" +
                            "JOIN\n" +
                            "    Paquete P ON P.id_paquete = M.id_paquete\n" +
                            "LEFT JOIN\n" +
                            "    Extra E ON M.id_mantenimiento = E.id_mantenimiento\n" +
                            "GROUP BY\n" +
                            "    M.id_empleado,\n" +
                            "    V.Imagen,\n" +
                            "    V.Marca,\n" +
                            "    M.id_mantenimiento,\n" +
                            "    M.Proceso,\n" +
                            "    M.Categoria,\n" +
                            "    M.Descripcion,\n" +
                            "    V.id_cliente,\n" +
                            "    M.NoSerie,\n" +
                            "    M.FechaInicio,\n" +
                            "    C.Nombre,\n" +
                            "    C.Apellido1,\n" +
                            "    C.Apellido2,\n" +
                            "    P.Nombre;");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Mantenimiento man = new Mantenimiento();
                man.setNoSerie(res.getString("M.NoSerie"));
                man.setFechaInicio(res.getString("M.fechaInicio"));
                man.setNombrePaquete(res.getString("nombre_paquete"));
                man.setNombreCliente(res.getString("C.nombre"));
                man.setDescripcion(res.getString("M.descripcion"));
                man.setCategoria(res.getString("M.categoria"));
                man.setId_mecanico(res.getInt("M.id_empleado"));
                man.setId_mantenimiento(res.getInt("M.id_mantenimiento"));
                man.setProceso(res.getInt("M.proceso"));
                man.setApellido1(res.getString("C.apellido1"));
                man.setApellido2(res.getString("C.apellido2"));
                man.setMarca(res.getString("V.marca"));
                man.setExtras(res.getInt("cantidad_productos_extra"));
                listMantenimientosTotales.add(man);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listMantenimientosTotales;
    }

    public List MostrarMantenimientoCliente(int id) {
        MySqlConector conector = new MySqlConector();
        List<Mantenimiento> listMantenimientoCliente = new ArrayList<>();
        try (Connection con = conector.connect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT\n" +
                            "    C.idcliente,\n" +
                            "    P.Costo,\n" +
                            "    V.Imagen,\n" +
                            "    V.Marca,\n" +
                            "    M.id_mantenimiento,\n" +
                            "    M.Proceso,\n" +
                            "    M.Categoria,\n" +
                            "    M.Descripcion,\n" +
                            "    V.id_cliente,\n" +
                            "    M.NoSerie,\n" +
                            "    M.FechaInicio,\n" +
                            "    C.Nombre,\n" +
                            "    C.Apellido1,\n" +
                            "    C.Apellido2,\n" +
                            "    P.Nombre AS nombre_paquete,\n" +
                            "    COUNT(E.id_producto) AS cantidad_productos_extra\n" +
                            "FROM\n" +
                            "    Cliente C\n" +
                            "JOIN\n" +
                            "    Vehiculo V ON V.id_cliente = C.idcliente\n" +
                            "JOIN\n" +
                            "    Mantenimiento M ON V.NoSerie = M.NoSerie\n" +
                            "JOIN\n" +
                            "    Paquete P ON P.id_paquete = M.id_paquete\n" +
                            "LEFT JOIN\n" +
                            "    Extra E ON M.id_mantenimiento = E.id_mantenimiento\n" +
                            "WHERE\n" +
                            "    C.idcliente = ?\n" +
                            "GROUP BY\n" +
                            "    C.idcliente,\n" +
                            "    P.Costo,\n" +
                            "    V.Imagen,\n" +
                            "    V.Marca,\n" +
                            "    M.id_mantenimiento,\n" +
                            "    M.Proceso,\n" +
                            "    M.Categoria,\n" +
                            "    M.Descripcion,\n" +
                            "    V.id_cliente,\n" +
                            "    M.NoSerie,\n" +
                            "    M.FechaInicio,\n" +
                            "    C.Nombre,\n" +
                            "    C.Apellido1,\n" +
                            "    C.Apellido2,\n" +
                            "    P.Nombre");
            stmt.setInt(1, id);
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Mantenimiento man = new Mantenimiento();
                man.setNoSerie(res.getString("M.NoSerie"));
                man.setFechaInicio(res.getString("M.FechaInicio"));
                man.setNombrePaquete(res.getString("nombre_paquete"));
                man.setNombreCliente(res.getString("C.Nombre"));
                man.setDescripcion(res.getString("M.Descripcion"));
                man.setCategoria(res.getString("M.Categoria"));
                man.setId_mecanico(res.getInt("V.id_cliente"));
                man.setId_mantenimiento(res.getInt("M.id_mantenimiento"));
                man.setProceso(res.getInt("M.Proceso"));
                man.setApellido1(res.getString("C.Apellido1"));
                man.setApellido2(res.getString("C.Apellido2"));
                man.setMarca(res.getString("V.Marca"));
                man.setExtras(res.getInt("cantidad_productos_extra"));
                man.setCostopaquete(res.getInt("P.Costo"));
                listMantenimientoCliente.add(man);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listMantenimientoCliente;
    }


}


