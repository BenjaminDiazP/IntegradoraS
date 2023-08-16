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
                    "SELECT C.nombre, C.correo, C.apellido1,C.apellido2, V.placas, V.Marca FROM Cliente C JOIN Vehiculo V on C.idcliente = V.id_cliente  WHERE C.correo= ?");
            stmt.setString(1, query.trim());
            ResultSet res = stmt.executeQuery();

            if (res.next()) {
                man.setNombreCliente(res.getString("C.nombre"));
                man.setCorreo(res.getString("C.correo"));
                man.setPlacas(res.getString("V.placas"));
                man.setMarca(res.getString("V.Marca"));
                man.setApellido1(res.getString("C.apellido1"));
                man.setApellido2(res.getString("C.apellido2"));
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
                    "SELECT * from Empleado  WHERE rol = 'Mecanico' ");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Usuario usr = new Usuario();
                usr.setNombre(res.getString("nombre"));
                usr.setApellido1(res.getString("apellido1"));
                usr.setApellido2(res.getString("apellido2"));
                usr.setId_usuario(res.getInt("id_empleado"));
                usr.setCorreo(res.getString("correo"));

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
                    "SELECT nombre FROM Paquete WHERE categoria = ?");
            stmt.setString(1, categoria);
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                String nombreP = res.getString("nombre");
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
                    "INSERT INTO MANTENIMIENTO (NoSerie, id_empleado, id_paquete, categoria, fechaInicio, fechaFin, proceso, total, descripcion)" +
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
                    "SELECT id_paquete from Paquete WHERE nombre= ?"
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
                    "SELECT V.noSerie as numeroSerie from Vehiculo V JOIN Cliente C on  C.idcliente = V.id_cliente  WHERE C.correo = ?"
            );
            stmt.setString(1, correo.trim());
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                noSerie = res.getString("numeroSerie");
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
                    "SELECT  costo from Paquete where nombre = ?"
            );
            stmt.setString(1, paquete);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                precio = res.getDouble("costo");
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
                            "    P.costo,\n" +
                            "    V.Imagen,\n" +
                            "    V.marca,\n" +
                            "    M.id_mantenimiento,\n" +
                            "    M.proceso,\n" +
                            "    M.categoria,\n" +
                            "    M.descripcion,\n" +
                            "    V.id_cliente,\n" +
                            "    M.NoSerie,\n" +
                            "    M.fechaInicio,\n" +
                            "    C.nombre,\n" +
                            "    C.apellido1,\n" +
                            "    C.apellido2,\n" +
                            "    P.nombre AS nombre_paquete,\n" +
                            "    COUNT(E.id_producto) AS cantidad_productos_extra\n" +
                            "FROM\n" +
                            "    Cliente C\n" +
                            "JOIN\n" +
                            "    Vehiculo V ON V.id_cliente = C.idcliente\n" +
                            "JOIN\n" +
                            "    MANTENIMIENTO M ON V.NoSerie = M.NoSerie\n" +
                            "JOIN\n" +
                            "    PAQUETE P ON P.id_paquete = M.id_paquete\n" +
                            "LEFT JOIN\n" +
                            "    extra E ON M.id_mantenimiento = E.id_mantenimiento\n" +
                            "WHERE\n" +
                            "    M.id_empleado=?\n" +
                            "GROUP BY\n" +
                            "    M.id_empleado,\n" +
                            "    V.Imagen,\n" +
                            "    V.marca,\n" +
                            "    M.id_mantenimiento,\n" +
                            "    M.proceso,\n" +
                            "    M.categoria,\n" +
                            "    M.descripcion,\n" +
                            "    V.id_cliente,\n" +
                            "    M.NoSerie,\n" +
                            "    M.fechaInicio,\n" +
                            "    C.nombre,\n" +
                            "    C.apellido1,\n" +
                            "    C.apellido2,\n" +
                            "    P.nombre;");
            stmt.setInt(1, id);
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
                    "SELECT V.Imagen, M.*, C.nombre, C.apellido1, C.apellido2, P.nombre as nombreP from Cliente C  JOIN Vehiculo V on V.id_cliente = C.idcliente JOIN MANTENIMIENTO M on V.noSerie = M.noSerie JOIN PAQUETE P " +
                    " on P.Id_paquete = M.id_paquete  where M.id_mantenimiento = ?");

            stmt.setInt(1, id);
            ResultSet res = stmt.executeQuery();

            while (res.next()) {
                Mantenimiento man = new Mantenimiento();
                man.setNoSerie(res.getString("NoSerie"));
                man.setFechaInicio(res.getString("fechaInicio"));
                man.setNombrePaquete(res.getString("nombreP"));
                man.setNombreCliente(res.getString("C.nombre"));
                man.setDescripcion(res.getString("descripcion"));
                man.setCategoria(res.getString("categoria"));
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
            PreparedStatement stmt = con.prepareStatement("INSERT INTO EXTRA (id_mantenimiento, id_producto) VALUES (?,?)");

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
            PreparedStatement stmt = con.prepareStatement("SELECT id_producto FROM PRODUCTO where nombre =?");
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
            PreparedStatement stmt = con.prepareStatement("SELECT P.* FROM Producto P JOIN EXTRA E on E.id_producto =" +
                    " P.id_producto JOIN mantenimiento M on M.id_mantenimiento = E. id_mantenimiento where M.id_mantenimiento = ?");
            stmt.setInt(1, id_mantenimiento);
            ResultSet res = stmt.executeQuery();

            while (res.next()) {
                Articulo art = new Articulo();
                art.setNombre(res.getString("nombre"));
                art.setCategoria(res.getString("categoria"));
                art.setCosto(res.getFloat("costo"));
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
            PreparedStatement stmt = con.prepareStatement("UPDATE MANTENIMIENTO SET proceso = ? WHERE id_mantenimiento = ?");
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
            PreparedStatement stmt = con.prepareStatement("SELECT proceso FROM MANTENIMIENTO WHERE id_mantenimiento = ?");
            stmt.setInt(1, id_manetenimiento);
            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                porcentaje = resultSet.getInt("proceso");
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
            PreparedStatement stmt = con.prepareStatement("SELECT C.correo FROM cliente C join vehiculo V on V.id_cliente = C.idcliente JOIN mantenimiento M on M.NoSerie = V.NoSerie where M.id_mantenimiento = ?");
            stmt.setInt(1, id);
            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                correo = resultSet.getString("C.correo");
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
            PreparedStatement stmt = con.prepareStatement("SELECT P.nombre, P.costo FROM Producto P JOIN extra E ON P.id_producto = E.id_producto WHERE E.id_mantenimiento = ?");
            stmt.setInt(1, idMantenimiento);
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                ProductoExtra productoExtra = new ProductoExtra();
                productoExtra.setNombre(res.getString("P.nombre"));
                productoExtra.setPrecio(res.getDouble("P.costo"));
                listaProductosExtra.add(productoExtra);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaProductosExtra;
    }



}
