package com.pojos;
// Generated Sep 22, 2019 11:27:50 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Grado generated by hbm2java
 */
public class Grado  implements java.io.Serializable {


     private int idGrado;
     private String nomGrado;
     private Set<Asignacion> asignacions = new HashSet<Asignacion>(0);

    public Grado() {
    }

	
    public Grado(int idGrado) {
        this.idGrado = idGrado;
    }
    public Grado(int idGrado, String nomGrado, Set<Asignacion> asignacions) {
       this.idGrado = idGrado;
       this.nomGrado = nomGrado;
       this.asignacions = asignacions;
    }
   
    public int getIdGrado() {
        return this.idGrado;
    }
    
    public void setIdGrado(int idGrado) {
        this.idGrado = idGrado;
    }
    public String getNomGrado() {
        return this.nomGrado;
    }
    
    public void setNomGrado(String nomGrado) {
        this.nomGrado = nomGrado;
    }
    public Set<Asignacion> getAsignacions() {
        return this.asignacions;
    }
    
    public void setAsignacions(Set<Asignacion> asignacions) {
        this.asignacions = asignacions;
    }




}


