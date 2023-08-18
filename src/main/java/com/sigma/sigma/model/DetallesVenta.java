package com.sigma.sigma.model;
import java.util.Date;
import java.util.List;

public class DetallesVenta {
    private String nombreApellidoCliente;
    private int idCliente;
    private double totalSuma;
    private String tipoPago;
    private int idTablaPedido;
    private String correo;
    private String nombreApellidoEmpleado;
    private String matricula;
    private String fecha;
    private List<Articulo> listaDeProductos;


    public String getNombreApellidoCliente() {
        return nombreApellidoCliente;
    }

    public void setNombreApellidoCliente(String nombreApellidoCliente) {
        this.nombreApellidoCliente = nombreApellidoCliente;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public double getTotalSuma() {
        return totalSuma;
    }

    public void setTotalSuma(double totalSuma) {
        this.totalSuma = totalSuma;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public int getIdTablaPedido() {
        return idTablaPedido;
    }

    public void setIdTablaPedido(int idTablaPedido) {
        this.idTablaPedido = idTablaPedido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombreApellidoEmpleado() {
        return nombreApellidoEmpleado;
    }

    public void setNombreApellidoEmpleado(String nombreApellidoEmpleado) {
        this.nombreApellidoEmpleado = nombreApellidoEmpleado;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public List<Articulo> getListaDeProductos() {
        return listaDeProductos;
    }

    public void setListaDeProductos(List<Articulo> listaDeProductos) {
        this.listaDeProductos = listaDeProductos;
    }

    public DetallesVenta(String nombreApellidoCliente, int idCliente, double totalSuma, String tipoPago, int idTablaPedido, String correo, String nombreApellidoEmpleado, String matricula, String fecha, List<Articulo> listaDeProductos) {
        this.nombreApellidoCliente = nombreApellidoCliente;
        this.idCliente = idCliente;
        this.totalSuma = totalSuma;
        this.tipoPago = tipoPago;
        this.idTablaPedido = idTablaPedido;
        this.correo = correo;
        this.nombreApellidoEmpleado = nombreApellidoEmpleado;
        this.matricula = matricula;
        this.fecha = fecha;
        this.listaDeProductos = listaDeProductos;
    }

    public DetallesVenta() {
    }
}