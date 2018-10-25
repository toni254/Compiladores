/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upds.compilador.model;

/**
 *
 * @author hell
 */
public class Tokens {
    private int tokenid;
    private String token;
    private int linea;
    private int columna;
    private String contenido;

    public Tokens(int tokenid, String token, int linea, int columna, String contenido) {
        this.tokenid = tokenid;
        this.token = token;
        this.linea = linea;
        this.columna = columna;
        this.contenido = contenido;
    }

    public int getTokenid() {
        return tokenid;
    }

    public void setTokenid(int tokenid) {
        this.tokenid = tokenid;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getLinea() {
        return linea;
    }

    public void setLinea(int linea) {
        this.linea = linea;
    }

    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
}
