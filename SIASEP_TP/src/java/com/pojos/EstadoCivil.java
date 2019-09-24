package com.pojos;
// Generated Sep 22, 2019 11:27:50 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * EstadoCivil generated by hbm2java
 */
public class EstadoCivil  implements java.io.Serializable {


     private int idEstadoCivil;
     private String nomEstadoCivil;
     private Set<PerFamiliar> perFamiliars = new HashSet<PerFamiliar>(0);

    public EstadoCivil() {
    }

	
    public EstadoCivil(int idEstadoCivil) {
        this.idEstadoCivil = idEstadoCivil;
    }
    public EstadoCivil(int idEstadoCivil, String nomEstadoCivil, Set<PerFamiliar> perFamiliars) {
       this.idEstadoCivil = idEstadoCivil;
       this.nomEstadoCivil = nomEstadoCivil;
       this.perFamiliars = perFamiliars;
    }
   
    public int getIdEstadoCivil() {
        return this.idEstadoCivil;
    }
    
    public void setIdEstadoCivil(int idEstadoCivil) {
        this.idEstadoCivil = idEstadoCivil;
    }
    public String getNomEstadoCivil() {
        return this.nomEstadoCivil;
    }
    
    public void setNomEstadoCivil(String nomEstadoCivil) {
        this.nomEstadoCivil = nomEstadoCivil;
    }
    public Set<PerFamiliar> getPerFamiliars() {
        return this.perFamiliars;
    }
    
    public void setPerFamiliars(Set<PerFamiliar> perFamiliars) {
        this.perFamiliars = perFamiliars;
    }




}


