package com.sigma.sigma.model;

import java.util.List;

public class ProductoVentaInfo {

    private int idProductoVenta; //
    private String nombreApellido; //
    private String correoElectronico; //
    private String MatriculaVehiculo; //
    private String fecha; //
    private String AtendidoPor; //
    private String Producto; //
    private Float total; //
    private List<String> ListaArticulo;
    private int id_cliente;
    private int id_empleado;
    private String tipoPago; //
    private int id_producto;
    private  String nombre;
    private Float precio; //
    private String categoria;
    private List <Articulo> listaDeProductos;


    public int getIdProductoVenta() {
        return idProductoVenta;
    }

    public void setIdProductoVenta(int idProductoVenta) {
        this.idProductoVenta = idProductoVenta;
    }

    public String getNombreApellido() {
        return nombreApellido;
    }

    public void setNombreApellido(String nombreApellido) {
        this.nombreApellido = nombreApellido;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public List<String> getListaArticulo() {
        return ListaArticulo;
    }

    public void setListaArticulo(List<String> listaArticulo) {
        ListaArticulo = listaArticulo;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getMatriculaVehiculo() {
        return MatriculaVehiculo;
    }

    public void setMatriculaVehiculo(String matriculaVehiculo) {
        MatriculaVehiculo = matriculaVehiculo;
    }

    public String getAtendidoPor() {
        return AtendidoPor;
    }

    public void setAtendidoPor(String atendidoPor) {
        AtendidoPor = atendidoPor;
    }

    public String getProducto() {
        return Producto;
    }

    public void setProducto(String producto) {
        Producto = producto;
    }

    public List<Articulo> getListaDeProductos() {
        return listaDeProductos;
    }

    public void setListaDeProductos(List<Articulo> listaDeProductos) {
        this.listaDeProductos = listaDeProductos;
    }




    public ProductoVentaInfo( int id_empleado, String tipoPago, String correoElectronico ) {
     this.correoElectronico = correoElectronico;
     this. id_empleado = id_empleado;
     this.tipoPago = tipoPago;

    }
    public ProductoVentaInfo() {

    }

    public ProductoVentaInfo(int idProductoVenta, String nombreApellido, String correoElectronico, String matriculaVehiculo, String fecha, String atendidoPor, String producto, Float total, List<String> listaArticulo, int id_cliente, int id_empleado, String tipoPago, int id_producto, String nombre, Float precio, String categoria, List<Articulo> listaDeProductos) {
        this.idProductoVenta = idProductoVenta;
        this.nombreApellido = nombreApellido;
        this.correoElectronico = correoElectronico;
        this.MatriculaVehiculo = matriculaVehiculo;
        this.fecha = fecha;
        this.AtendidoPor = atendidoPor;
        this.Producto = producto;
        this.total = total;
        this.ListaArticulo = listaArticulo;
        this.id_cliente = id_cliente;
        this.id_empleado = id_empleado;
        this.tipoPago = tipoPago;
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.precio = precio;
        this.categoria = categoria;
        this.listaDeProductos = listaDeProductos;
    }


}




