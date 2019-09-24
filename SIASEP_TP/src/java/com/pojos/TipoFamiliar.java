package com.pojos;
// Generated Sep 22, 2019 11:27:50 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * TipoFamiliar generated by hbm2java
 */
public class TipoFamiliar  implements java.io.Serializable {


     private int idTipoFamiliar;
     private String nomTipoFamiliar;
     private Set<PerFamiliar> perFamiliars = new HashSet<PerFamiliar>(0);

    public TipoFamiliar() {
    }

	
    public TipoFamiliar(int idTipoFamiliar) {
        this.idTipoFamiliar = idTipoFamiliar;
    }
    public TipoFamiliar(int idTipoFamiliar, String nomTipoFamiliar, Set<PerFamiliar> perFamiliars) {
       this.idTipoFamiliar = idTipoFamiliar;
       this.nomTipoFamiliar = nomTipoFamiliar;
       this.perFamiliars = perFamiliars;
    }
   
    public int getIdTipoFamiliar() {
        return this.idTipoFamiliar;
    }
    
    public void setIdTipoFamiliar(int idTipoFamiliar) {
        this.idTipoFamiliar = idTipoFamiliar;
    }
    public String getNomTipoFamiliar() {
        return this.nomTipoFamiliar;
    }
    
    public void setNomTipoFamiliar(String nomTipoFamiliar) {
        this.nomTipoFamiliar = nomTipoFamiliar;
    }
    public Set<PerFamiliar> getPerFamiliars() {
        return this.perFamiliars;
    }
    
    public void setPerFamiliars(Set<PerFamiliar> perFamiliars) {
        this.perFamiliars = perFamiliars;
    }




}


