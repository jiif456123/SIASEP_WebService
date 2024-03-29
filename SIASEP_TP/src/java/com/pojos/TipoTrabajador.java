package com.pojos;
// Generated Oct 28, 2019 1:09:51 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * TipoTrabajador generated by hbm2java
 */
public class TipoTrabajador  implements java.io.Serializable {


     private int idTipoTrabajador;
     private String nomTipoTrabajador;
     private Set<PerTrabajador> perTrabajadors = new HashSet<PerTrabajador>(0);

    public TipoTrabajador() {
    }

	
    public TipoTrabajador(int idTipoTrabajador, String nomTipoTrabajador) {
        this.idTipoTrabajador = idTipoTrabajador;
        this.nomTipoTrabajador = nomTipoTrabajador;
    }
    public TipoTrabajador(int idTipoTrabajador, String nomTipoTrabajador, Set<PerTrabajador> perTrabajadors) {
       this.idTipoTrabajador = idTipoTrabajador;
       this.nomTipoTrabajador = nomTipoTrabajador;
       this.perTrabajadors = perTrabajadors;
    }
   
    public int getIdTipoTrabajador() {
        return this.idTipoTrabajador;
    }
    
    public void setIdTipoTrabajador(int idTipoTrabajador) {
        this.idTipoTrabajador = idTipoTrabajador;
    }
    public String getNomTipoTrabajador() {
        return this.nomTipoTrabajador;
    }
    
    public void setNomTipoTrabajador(String nomTipoTrabajador) {
        this.nomTipoTrabajador = nomTipoTrabajador;
    }
    public Set<PerTrabajador> getPerTrabajadors() {
        return this.perTrabajadors;
    }
    
    public void setPerTrabajadors(Set<PerTrabajador> perTrabajadors) {
        this.perTrabajadors = perTrabajadors;
    }




}


