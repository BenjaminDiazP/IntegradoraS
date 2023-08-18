package com.sigma.sigma.model;

public class ProductoVenta {
    private  int id_cliente;
    private  int id_producto;
    private Float precio;

    //Crear constructor getters and setters

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }


    public ProductoVenta(int id_cliente, int id_producto, Float precio) {
        this.id_cliente = id_cliente;
        this.id_producto = id_producto;
        this.precio = precio;
    }

    public ProductoVenta() {

    }
}
