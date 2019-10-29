package com.pojos;
// Generated Oct 28, 2019 1:09:51 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * TipoUsuario generated by hbm2java
 */
public class TipoUsuario  implements java.io.Serializable {


     private int idTipoUsuario;
     private String nomTipoUsuario;
     private String dscrpTipoUsuario;
     private Set<MultiRole> multiRoles = new HashSet<MultiRole>(0);

    public TipoUsuario() {
    }

	
    public TipoUsuario(int idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }
    public TipoUsuario(int idTipoUsuario, String nomTipoUsuario, String dscrpTipoUsuario, Set<MultiRole> multiRoles) {
       this.idTipoUsuario = idTipoUsuario;
       this.nomTipoUsuario = nomTipoUsuario;
       this.dscrpTipoUsuario = dscrpTipoUsuario;
       this.multiRoles = multiRoles;
    }
   
    public int getIdTipoUsuario() {
        return this.idTipoUsuario;
    }
    
    public void setIdTipoUsuario(int idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }
    public String getNomTipoUsuario() {
        return this.nomTipoUsuario;
    }
    
    public void setNomTipoUsuario(String nomTipoUsuario) {
        this.nomTipoUsuario = nomTipoUsuario;
    }
    public String getDscrpTipoUsuario() {
        return this.dscrpTipoUsuario;
    }
    
    public void setDscrpTipoUsuario(String dscrpTipoUsuario) {
        this.dscrpTipoUsuario = dscrpTipoUsuario;
    }
    public Set<MultiRole> getMultiRoles() {
        return this.multiRoles;
    }
    
    public void setMultiRoles(Set<MultiRole> multiRoles) {
        this.multiRoles = multiRoles;
    }




}

