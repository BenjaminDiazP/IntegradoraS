package com.sigma.sigma.model;

public class Articulo {

    private int id_producto;
    private String nombre;
    private Double costo;
    private String categoria;
    private int stock;
    private int identificador;
    private String imagen;

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }

    public Articulo(int id_producto, String nombre, double costo, String categoria, int stock) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.costo = costo;
        this.categoria = categoria;
        this.stock = stock;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
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

    public Double getCosto() {
        return costo;
    }

    public void setCosto(Double costo) {
        this.costo = costo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Articulo( String nombre, Double costo, String categoria, int stock) {
        this.nombre = nombre;
        this.costo = costo;
        this.categoria = categoria;
        this.stock = stock;
    }

    public Articulo() {

    }

}
