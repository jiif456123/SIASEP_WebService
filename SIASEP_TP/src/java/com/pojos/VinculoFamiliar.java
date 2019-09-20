package com.pojos;
// Generated Sep 20, 2019 1:20:47 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * VinculoFamiliar generated by hbm2java
 */
public class VinculoFamiliar  implements java.io.Serializable {


     private VinculoFamiliarId id;
     private PerAlumno perAlumno;
     private PerApoderado perApoderado;
     private boolean flgOfiApoderado;
     private Date fecInicio;
     private Date fecFin;

    public VinculoFamiliar() {
    }

	
    public VinculoFamiliar(VinculoFamiliarId id, PerAlumno perAlumno, PerApoderado perApoderado, boolean flgOfiApoderado) {
        this.id = id;
        this.perAlumno = perAlumno;
        this.perApoderado = perApoderado;
        this.flgOfiApoderado = flgOfiApoderado;
    }
    public VinculoFamiliar(VinculoFamiliarId id, PerAlumno perAlumno, PerApoderado perApoderado, boolean flgOfiApoderado, Date fecInicio, Date fecFin) {
       this.id = id;
       this.perAlumno = perAlumno;
       this.perApoderado = perApoderado;
       this.flgOfiApoderado = flgOfiApoderado;
       this.fecInicio = fecInicio;
       this.fecFin = fecFin;
    }
   
    public VinculoFamiliarId getId() {
        return this.id;
    }
    
    public void setId(VinculoFamiliarId id) {
        this.id = id;
    }
    public PerAlumno getPerAlumno() {
        return this.perAlumno;
    }
    
    public void setPerAlumno(PerAlumno perAlumno) {
        this.perAlumno = perAlumno;
    }
    public PerApoderado getPerApoderado() {
        return this.perApoderado;
    }
    
    public void setPerApoderado(PerApoderado perApoderado) {
        this.perApoderado = perApoderado;
    }
    public boolean isFlgOfiApoderado() {
        return this.flgOfiApoderado;
    }
    
    public void setFlgOfiApoderado(boolean flgOfiApoderado) {
        this.flgOfiApoderado = flgOfiApoderado;
    }
    public Date getFecInicio() {
        return this.fecInicio;
    }
    
    public void setFecInicio(Date fecInicio) {
        this.fecInicio = fecInicio;
    }
    public Date getFecFin() {
        return this.fecFin;
    }
    
    public void setFecFin(Date fecFin) {
        this.fecFin = fecFin;
    }




}


