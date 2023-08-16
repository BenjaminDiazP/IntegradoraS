package com.sigma.sigma.model;

import java.util.List;

public class Paquete {
    private String nombre;
    private double precio;
    private String categoria;
    private List<String> elementos;

    public Paquete(String nombre, double precio, String categoria, List<String> elementos) {
        this.nombre = nombre;
        this.precio = precio;
        this.categoria = categoria;
        this.elementos = elementos;
    }
    public Paquete(String nombre, String categoria) {
        this.nombre = nombre;
        this.categoria = categoria;
    }
    public Paquete() {

    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public List<String> getElementos() {
        return elementos;
    }

    public void setElementos(List<String> elementos) {
        this.elementos = elementos;
    }
}
