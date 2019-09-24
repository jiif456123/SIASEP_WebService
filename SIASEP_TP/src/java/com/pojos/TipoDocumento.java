package com.pojos;
// Generated Sep 22, 2019 11:27:50 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * TipoDocumento generated by hbm2java
 */
public class TipoDocumento  implements java.io.Serializable {


     private int idTipoDocumento;
     private String nomTipoDocumento;
     private Set<Persona> personas = new HashSet<Persona>(0);

    public TipoDocumento() {
    }

	
    public TipoDocumento(int idTipoDocumento) {
        this.idTipoDocumento = idTipoDocumento;
    }
    public TipoDocumento(int idTipoDocumento, String nomTipoDocumento, Set<Persona> personas) {
       this.idTipoDocumento = idTipoDocumento;
       this.nomTipoDocumento = nomTipoDocumento;
       this.personas = personas;
    }
   
    public int getIdTipoDocumento() {
        return this.idTipoDocumento;
    }
    
    public void setIdTipoDocumento(int idTipoDocumento) {
        this.idTipoDocumento = idTipoDocumento;
    }
    public String getNomTipoDocumento() {
        return this.nomTipoDocumento;
    }
    
    public void setNomTipoDocumento(String nomTipoDocumento) {
        this.nomTipoDocumento = nomTipoDocumento;
    }
    public Set<Persona> getPersonas() {
        return this.personas;
    }
    
    public void setPersonas(Set<Persona> personas) {
        this.personas = personas;
    }




}


