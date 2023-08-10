package com.sigma.sigma.model;

public class Vehiculo {

    private String noSerie;
    private int idCliente;
    private String marca;
    private int modelo;
    private String color;
    private String tipoCombustible;
    private String placas;
    private String tipoTransmision;
    private String noMotor;
    private String tipo;
    private String imagen;
    private String fechaRegistro;
    private String estado;
    private int identificador;

    public Vehiculo(String noSerie, int idCliente, String marca, int modelo, String color, String tipoCombustible, String placas, String tipoTransmision, String noMotor, String tipo, String imagen, String fechaRegistro, String estado,int identificador) {
        this.noSerie = noSerie;
        this.idCliente = idCliente;
        this.marca = marca;
        this.modelo = modelo;
        this.color = color;
        this.tipoCombustible = tipoCombustible;
        this.placas = placas;
        this.tipoTransmision = tipoTransmision;
        this.noMotor = noMotor;
        this.tipo = tipo;
        this.imagen = imagen;
        this.fechaRegistro = fechaRegistro;
        this.estado = estado;
        this.identificador = identificador;
    }

    public Vehiculo(String noSerie, int idCliente, String marca, int modelo, String color, String tipoCombustible, String placas, String tipoTransmision, String noMotor, String tipo, String imagen, String fechaRegistro, String estado) {
        this.noSerie = noSerie;
        this.idCliente = idCliente;
        this.marca = marca;
        this.modelo = modelo;
        this.color = color;
        this.tipoCombustible = tipoCombustible;
        this.placas = placas;
        this.tipoTransmision = tipoTransmision;
        this.noMotor = noMotor;
        this.tipo = tipo;
        this.imagen = imagen;
        this.fechaRegistro = fechaRegistro;
        this.estado = estado;
    }


    public Vehiculo(String noSerie, int idCliente, String marca, int modelo, String color, String tipoCombustible, String placas, String tipoTransmision, String noMotor, String tipo,String fechaRegistro) {
        this.noSerie = noSerie;
        this.idCliente = idCliente;
        this.marca = marca;
        this.modelo = modelo;
        this.color = color;
        this.tipoCombustible = tipoCombustible;
        this.placas = placas;
        this.tipoTransmision = tipoTransmision;
        this.noMotor = noMotor;
        this.tipo = tipo;
        this.fechaRegistro = fechaRegistro;
    }


    public Vehiculo(String noSerie, String marca, int modelo, String color,String placas ,String tipoCombustible, String tipoTransmision, String noMotor, String tipo) {
        this.noSerie = noSerie;
        this.marca = marca;
        this.modelo = modelo;
        this.color = color;
        this.placas = placas;
        this.tipoCombustible = tipoCombustible;
        this.tipoTransmision = tipoTransmision;
        this.noMotor = noMotor;
        this.tipo = tipo;
    }




    public Vehiculo() {

    }


    public String getNoSerie() {
        return noSerie;
    }

    public void setNoSerie(String noSerie) {
        this.noSerie = noSerie;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getModelo() {
        return modelo;
    }

    public void setModelo(int modelo) {
        this.modelo = modelo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getTipoCombustible() {
        return tipoCombustible;
    }

    public void setTipoCombustible(String tipoCombustible) {
        this.tipoCombustible = tipoCombustible;
    }

    public String getPlacas() {
        return placas;
    }

    public void setPlacas(String placas) {
        this.placas = placas;
    }

    public String getTipoTransmision() {
        return tipoTransmision;
    }

    public void setTipoTransmision(String tipoTransmision) {
        this.tipoTransmision = tipoTransmision;
    }

    public String getNoMotor() {
        return noMotor;
    }

    public void setNoMotor(String noMotor) {
        this.noMotor = noMotor;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(String fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }
}
