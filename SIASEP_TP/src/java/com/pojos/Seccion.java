package com.pojos;
// Generated Sep 20, 2019 1:20:47 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Seccion generated by hbm2java
 */
public class Seccion  implements java.io.Serializable {


     private int idSeccion;
     private String nomSeccion;
     private Set<Asignacion> asignacions = new HashSet<Asignacion>(0);

    public Seccion() {
    }

	
    public Seccion(int idSeccion) {
        this.idSeccion = idSeccion;
    }
    public Seccion(int idSeccion, String nomSeccion, Set<Asignacion> asignacions) {
       this.idSeccion = idSeccion;
       this.nomSeccion = nomSeccion;
       this.asignacions = asignacions;
    }
   
    public int getIdSeccion() {
        return this.idSeccion;
    }
    
    public void setIdSeccion(int idSeccion) {
        this.idSeccion = idSeccion;
    }
    public String getNomSeccion() {
        return this.nomSeccion;
    }
    
    public void setNomSeccion(String nomSeccion) {
        this.nomSeccion = nomSeccion;
    }
    public Set<Asignacion> getAsignacions() {
        return this.asignacions;
    }
    
    public void setAsignacions(Set<Asignacion> asignacions) {
        this.asignacions = asignacions;
    }




}

