package com.pojos;
// Generated Sep 19, 2019 6:21:09 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private int idUsuario;
     private EstadoUsuario estadoUsuario;
     private Persona persona;
     private String username;
     private String password;
     private Date fecCreacion;
     private Set<MultiRole> multiRoles = new HashSet<MultiRole>(0);

    public Usuario() {
    }

	
    public Usuario(int idUsuario, EstadoUsuario estadoUsuario, Persona persona, String username, String password) {
        this.idUsuario = idUsuario;
        this.estadoUsuario = estadoUsuario;
        this.persona = persona;
        this.username = username;
        this.password = password;
    }
    public Usuario(int idUsuario, EstadoUsuario estadoUsuario, Persona persona, String username, String password, Date fecCreacion, Set<MultiRole> multiRoles) {
       this.idUsuario = idUsuario;
       this.estadoUsuario = estadoUsuario;
       this.persona = persona;
       this.username = username;
       this.password = password;
       this.fecCreacion = fecCreacion;
       this.multiRoles = multiRoles;
    }
   
    public int getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    public EstadoUsuario getEstadoUsuario() {
        return this.estadoUsuario;
    }
    
    public void setEstadoUsuario(EstadoUsuario estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }
    public Persona getPersona() {
        return this.persona;
    }
    
    public void setPersona(Persona persona) {
        this.persona = persona;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Date getFecCreacion() {
        return this.fecCreacion;
    }
    
    public void setFecCreacion(Date fecCreacion) {
        this.fecCreacion = fecCreacion;
    }
    public Set<MultiRole> getMultiRoles() {
        return this.multiRoles;
    }
    
    public void setMultiRoles(Set<MultiRole> multiRoles) {
        this.multiRoles = multiRoles;
    }




}


