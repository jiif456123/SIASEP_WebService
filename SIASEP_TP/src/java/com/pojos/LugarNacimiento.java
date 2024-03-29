package com.pojos;
// Generated Oct 28, 2019 1:09:51 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * LugarNacimiento generated by hbm2java
 */
public class LugarNacimiento  implements java.io.Serializable {


     private int idLugarNacimiento;
     private String nomLugarNacimiento;
     private Set<Persona> personas = new HashSet<Persona>(0);

    public LugarNacimiento() {
    }

	
    public LugarNacimiento(int idLugarNacimiento) {
        this.idLugarNacimiento = idLugarNacimiento;
    }
    public LugarNacimiento(int idLugarNacimiento, String nomLugarNacimiento, Set<Persona> personas) {
       this.idLugarNacimiento = idLugarNacimiento;
       this.nomLugarNacimiento = nomLugarNacimiento;
       this.personas = personas;
    }
   
    public int getIdLugarNacimiento() {
        return this.idLugarNacimiento;
    }
    
    public void setIdLugarNacimiento(int idLugarNacimiento) {
        this.idLugarNacimiento = idLugarNacimiento;
    }
    public String getNomLugarNacimiento() {
        return this.nomLugarNacimiento;
    }
    
    public void setNomLugarNacimiento(String nomLugarNacimiento) {
        this.nomLugarNacimiento = nomLugarNacimiento;
    }
    public Set<Persona> getPersonas() {
        return this.personas;
    }
    
    public void setPersonas(Set<Persona> personas) {
        this.personas = personas;
    }




}


