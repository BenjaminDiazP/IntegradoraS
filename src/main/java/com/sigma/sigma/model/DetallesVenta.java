package com.sigma.sigma.model;
import java.util.Date;

public class DetallesVenta {
    private int idProductoVenta;
    private int idCliente;
    private int idProducto;
    private Date fecha;
    private float total;
    private String tipoPago;
    private  int id_empleado;


    public int getIdProductoVenta() {
        return idProductoVenta;
    }

    public void setIdProductoVenta(int idProductoVenta) {
        this.idProductoVenta = idProductoVenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    // Ejemplo de constructor
    public DetallesVenta(int idCliente, int idProducto, float total, String tipoPago) {
        this.idCliente = idCliente;
        this.idProducto = idProducto;
        this.fecha = new Date();
        this.total = total;
        this.tipoPago = tipoPago;
    }

    public DetallesVenta() {

    }
}