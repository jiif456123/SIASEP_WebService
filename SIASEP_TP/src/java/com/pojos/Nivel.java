package com.pojos;
// Generated Sep 19, 2019 6:21:09 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Nivel generated by hbm2java
 */
public class Nivel  implements java.io.Serializable {


     private int idNivel;
     private String nomNivel;
     private Set<Asignacion> asignacions = new HashSet<Asignacion>(0);

    public Nivel() {
    }

	
    public Nivel(int idNivel) {
        this.idNivel = idNivel;
    }
    public Nivel(int idNivel, String nomNivel, Set<Asignacion> asignacions) {
       this.idNivel = idNivel;
       this.nomNivel = nomNivel;
       this.asignacions = asignacions;
    }
   
    public int getIdNivel() {
        return this.idNivel;
    }
    
    public void setIdNivel(int idNivel) {
        this.idNivel = idNivel;
    }
    public String getNomNivel() {
        return this.nomNivel;
    }
    
    public void setNomNivel(String nomNivel) {
        this.nomNivel = nomNivel;
    }
    public Set<Asignacion> getAsignacions() {
        return this.asignacions;
    }
    
    public void setAsignacions(Set<Asignacion> asignacions) {
        this.asignacions = asignacions;
    }




}


