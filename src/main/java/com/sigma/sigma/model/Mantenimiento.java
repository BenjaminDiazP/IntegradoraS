package com.sigma.sigma.model;

import java.util.List;

public class Mantenimiento {

    private int id_mantenimiento;
    private  String nombreCliente;
    private String correo;
    private String marca;
    private String placas;
    private int id_mecanico;
    private String categoria;
    private int  id_paquete;
    private String fechaInicio;
    private int  proceso;
    private  String fechaFin;
    private  Float total;

    private String nombrePaquete;
    private String apellido1;
    private String apellido2;
    private List<ProductoExtra> listaProductosExtra;

    public List<ProductoExtra> getListaProductosExtra() {
        return listaProductosExtra;
    }

    public void setListaProductosExtra(List<ProductoExtra> listaProductosExtra) {
        this.listaProductosExtra = listaProductosExtra;
    }

    private  String imagen;
    private double precio;

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    private int extras;

    public int getExtras() {
        return extras;
    }

    public void setExtras(int extras) {
        this.extras = extras;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public int getId_mantenimiento() {
        return id_mantenimiento;
    }

    public void setId_mantenimiento(int id_mantenimiento) {
        this.id_mantenimiento = id_mantenimiento;
    }

    public String getNombrePaquete() {
        return nombrePaquete;
    }

    public void setNombrePaquete(String nombrePaquete) {
        this.nombrePaquete = nombrePaquete;
    }

    private String descripcion;

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public int getId_paquete() {
        return id_paquete;
    }

    public void setId_paquete(int id_paquete) {
        this.id_paquete = id_paquete;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public int getProceso() {
        return proceso;
    }

    public void setProceso(int proceso) {
        this.proceso = proceso;
    }

    private String noSerie;

    public Mantenimiento() {

    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getPlacas() {
        return placas;
    }

    public void setPlacas(String placas) {
        this.placas = placas;
    }

    public int getId_mecanico() {
        return id_mecanico;
    }

    public void setId_mecanico(int id_mecanico) {
        this.id_mecanico = id_mecanico;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int  getPaquete() {
        return id_paquete;
    }

    public void setPaquete(int  paquete) {
        this.id_paquete = paquete;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getNoSerie() {
        return noSerie;
    }

    public void setNoSerie(String noSerie) {
        this.noSerie = noSerie;
    }

    public Mantenimiento(String noSerie, int id_mecanico, int id_paquete, String fechaInicio, String fechaFin, Float total, String categoria, int proceso, String descripcion){
        this.noSerie = noSerie;
        this.id_mecanico = id_mecanico;
        this.id_paquete = id_paquete;
        this.fechaInicio = fechaInicio;
        this.proceso = proceso;
        this.fechaFin = fechaFin;
        this.total = total;
        this.categoria = categoria;
        this.descripcion = descripcion;
    }
    public Mantenimiento(String nombreCliente, String correo, String marca, String placas) {
        this.nombreCliente = nombreCliente;
        this.correo = correo;
        this.marca = marca;
        this.placas = placas;
    }

}
