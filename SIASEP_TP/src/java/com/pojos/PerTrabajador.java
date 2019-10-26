package com.pojos;
// Generated Oct 25, 2019 6:11:42 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * PerTrabajador generated by hbm2java
 */
public class PerTrabajador  implements java.io.Serializable {


     private int idPerTrabajador;
     private Persona persona;
     private TipoTrabajador tipoTrabajador;
     private int codigoTrabajador;
     private Set<HistorialMatricula> historialMatriculas = new HashSet<HistorialMatricula>(0);

    public PerTrabajador() {
    }

	
    public PerTrabajador(int idPerTrabajador, Persona persona, TipoTrabajador tipoTrabajador, int codigoTrabajador) {
        this.idPerTrabajador = idPerTrabajador;
        this.persona = persona;
        this.tipoTrabajador = tipoTrabajador;
        this.codigoTrabajador = codigoTrabajador;
    }
    public PerTrabajador(int idPerTrabajador, Persona persona, TipoTrabajador tipoTrabajador, int codigoTrabajador, Set<HistorialMatricula> historialMatriculas) {
       this.idPerTrabajador = idPerTrabajador;
       this.persona = persona;
       this.tipoTrabajador = tipoTrabajador;
       this.codigoTrabajador = codigoTrabajador;
       this.historialMatriculas = historialMatriculas;
    }
   
    public int getIdPerTrabajador() {
        return this.idPerTrabajador;
    }
    
    public void setIdPerTrabajador(int idPerTrabajador) {
        this.idPerTrabajador = idPerTrabajador;
    }
    public Persona getPersona() {
        return this.persona;
    }
    
    public void setPersona(Persona persona) {
        this.persona = persona;
    }
    public TipoTrabajador getTipoTrabajador() {
        return this.tipoTrabajador;
    }
    
    public void setTipoTrabajador(TipoTrabajador tipoTrabajador) {
        this.tipoTrabajador = tipoTrabajador;
    }
    public int getCodigoTrabajador() {
        return this.codigoTrabajador;
    }
    
    public void setCodigoTrabajador(int codigoTrabajador) {
        this.codigoTrabajador = codigoTrabajador;
    }
    public Set<HistorialMatricula> getHistorialMatriculas() {
        return this.historialMatriculas;
    }
    
    public void setHistorialMatriculas(Set<HistorialMatricula> historialMatriculas) {
        this.historialMatriculas = historialMatriculas;
    }




}


