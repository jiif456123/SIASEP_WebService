package com.pojos;
// Generated Oct 28, 2019 1:09:51 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * HistorialMatricula generated by hbm2java
 */
public class HistorialMatricula  implements java.io.Serializable {


     private int idHistorialMatricula;
     private Matricula matricula;
     private PerTrabajador perTrabajador;
     private Date fecModificacion;
     private String dscrpObservacion;

    public HistorialMatricula() {
    }

    public HistorialMatricula(int idHistorialMatricula, Matricula matricula, PerTrabajador perTrabajador, Date fecModificacion, String dscrpObservacion) {
       this.idHistorialMatricula = idHistorialMatricula;
       this.matricula = matricula;
       this.perTrabajador = perTrabajador;
       this.fecModificacion = fecModificacion;
       this.dscrpObservacion = dscrpObservacion;
    }
   
    public int getIdHistorialMatricula() {
        return this.idHistorialMatricula;
    }
    
    public void setIdHistorialMatricula(int idHistorialMatricula) {
        this.idHistorialMatricula = idHistorialMatricula;
    }
    public Matricula getMatricula() {
        return this.matricula;
    }
    
    public void setMatricula(Matricula matricula) {
        this.matricula = matricula;
    }
    public PerTrabajador getPerTrabajador() {
        return this.perTrabajador;
    }
    
    public void setPerTrabajador(PerTrabajador perTrabajador) {
        this.perTrabajador = perTrabajador;
    }
    public Date getFecModificacion() {
        return this.fecModificacion;
    }
    
    public void setFecModificacion(Date fecModificacion) {
        this.fecModificacion = fecModificacion;
    }
    public String getDscrpObservacion() {
        return this.dscrpObservacion;
    }
    
    public void setDscrpObservacion(String dscrpObservacion) {
        this.dscrpObservacion = dscrpObservacion;
    }




}


