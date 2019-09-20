package com.pojos;
// Generated Sep 20, 2019 1:20:47 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * TipoApoderado generated by hbm2java
 */
public class TipoApoderado  implements java.io.Serializable {


     private int idTipoApoderado;
     private String nomTipoApoderado;
     private Set<PerApoderado> perApoderados = new HashSet<PerApoderado>(0);

    public TipoApoderado() {
    }

	
    public TipoApoderado(int idTipoApoderado) {
        this.idTipoApoderado = idTipoApoderado;
    }
    public TipoApoderado(int idTipoApoderado, String nomTipoApoderado, Set<PerApoderado> perApoderados) {
       this.idTipoApoderado = idTipoApoderado;
       this.nomTipoApoderado = nomTipoApoderado;
       this.perApoderados = perApoderados;
    }
   
    public int getIdTipoApoderado() {
        return this.idTipoApoderado;
    }
    
    public void setIdTipoApoderado(int idTipoApoderado) {
        this.idTipoApoderado = idTipoApoderado;
    }
    public String getNomTipoApoderado() {
        return this.nomTipoApoderado;
    }
    
    public void setNomTipoApoderado(String nomTipoApoderado) {
        this.nomTipoApoderado = nomTipoApoderado;
    }
    public Set<PerApoderado> getPerApoderados() {
        return this.perApoderados;
    }
    
    public void setPerApoderados(Set<PerApoderado> perApoderados) {
        this.perApoderados = perApoderados;
    }




}

