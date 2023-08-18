package com.sigma.sigma.model;

public class Pedido {
    private int id_empleado;
    private String fecha;
    private String tipoPago;

    //Crear constructor y getters and setters


    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public Pedido(int id_empleado, String fecha, String tipoPago) {
        this.id_empleado = id_empleado;
        this.fecha = fecha;
        this.tipoPago = tipoPago;
    }

    public Pedido() {

    }
}
