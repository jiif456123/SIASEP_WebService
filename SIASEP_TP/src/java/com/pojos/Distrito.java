package com.pojos;
// Generated Sep 19, 2019 6:21:09 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Distrito generated by hbm2java
 */
public class Distrito  implements java.io.Serializable {


     private int idDistrito;
     private String nomDistrito;
     private Set<Persona> personas = new HashSet<Persona>(0);

    public Distrito() {
    }

	
    public Distrito(int idDistrito) {
        this.idDistrito = idDistrito;
    }
    public Distrito(int idDistrito, String nomDistrito, Set<Persona> personas) {
       this.idDistrito = idDistrito;
       this.nomDistrito = nomDistrito;
       this.personas = personas;
    }
   
    public int getIdDistrito() {
        return this.idDistrito;
    }
    
    public void setIdDistrito(int idDistrito) {
        this.idDistrito = idDistrito;
    }
    public String getNomDistrito() {
        return this.nomDistrito;
    }
    
    public void setNomDistrito(String nomDistrito) {
        this.nomDistrito = nomDistrito;
    }
    public Set<Persona> getPersonas() {
        return this.personas;
    }
    
    public void setPersonas(Set<Persona> personas) {
        this.personas = personas;
    }




}


