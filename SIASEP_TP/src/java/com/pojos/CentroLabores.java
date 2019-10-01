package com.pojos;
// Generated Sep 28, 2019 5:52:23 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * CentroLabores generated by hbm2java
 */
public class CentroLabores  implements java.io.Serializable {


     private int idCentroLabores;
     private String nomCentroLabores;
     private Set<PerFamiliar> perFamiliars = new HashSet<PerFamiliar>(0);

    public CentroLabores() {
    }

	
    public CentroLabores(int idCentroLabores) {
        this.idCentroLabores = idCentroLabores;
    }
    public CentroLabores(int idCentroLabores, String nomCentroLabores, Set<PerFamiliar> perFamiliars) {
       this.idCentroLabores = idCentroLabores;
       this.nomCentroLabores = nomCentroLabores;
       this.perFamiliars = perFamiliars;
    }
   
    public int getIdCentroLabores() {
        return this.idCentroLabores;
    }
    
    public void setIdCentroLabores(int idCentroLabores) {
        this.idCentroLabores = idCentroLabores;
    }
    public String getNomCentroLabores() {
        return this.nomCentroLabores;
    }
    
    public void setNomCentroLabores(String nomCentroLabores) {
        this.nomCentroLabores = nomCentroLabores;
    }
    public Set<PerFamiliar> getPerFamiliars() {
        return this.perFamiliars;
    }
    
    public void setPerFamiliars(Set<PerFamiliar> perFamiliars) {
        this.perFamiliars = perFamiliars;
    }




}


