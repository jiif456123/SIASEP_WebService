package com.pojos;
// Generated Oct 28, 2019 1:09:51 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * VinculoFamiliar generated by hbm2java
 */
public class VinculoFamiliar  implements java.io.Serializable {


     private VinculoFamiliarId id;
     private PerAlumno perAlumno;
     private PerFamiliar perFamiliar;
     private boolean flgOfiApoderado;
     private Date fecInicioVinculo;
     private Date fecFinVinculo;

    public VinculoFamiliar() {
    }

	
    public VinculoFamiliar(VinculoFamiliarId id, PerAlumno perAlumno, PerFamiliar perFamiliar, boolean flgOfiApoderado, Date fecInicioVinculo) {
        this.id = id;
        this.perAlumno = perAlumno;
        this.perFamiliar = perFamiliar;
        this.flgOfiApoderado = flgOfiApoderado;
        this.fecInicioVinculo = fecInicioVinculo;
    }
    public VinculoFamiliar(VinculoFamiliarId id, PerAlumno perAlumno, PerFamiliar perFamiliar, boolean flgOfiApoderado, Date fecInicioVinculo, Date fecFinVinculo) {
       this.id = id;
       this.perAlumno = perAlumno;
       this.perFamiliar = perFamiliar;
       this.flgOfiApoderado = flgOfiApoderado;
       this.fecInicioVinculo = fecInicioVinculo;
       this.fecFinVinculo = fecFinVinculo;
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
    public PerFamiliar getPerFamiliar() {
        return this.perFamiliar;
    }
    
    public void setPerFamiliar(PerFamiliar perFamiliar) {
        this.perFamiliar = perFamiliar;
    }
    public boolean isFlgOfiApoderado() {
        return this.flgOfiApoderado;
    }
    
    public void setFlgOfiApoderado(boolean flgOfiApoderado) {
        this.flgOfiApoderado = flgOfiApoderado;
    }
    public Date getFecInicioVinculo() {
        return this.fecInicioVinculo;
    }
    
    public void setFecInicioVinculo(Date fecInicioVinculo) {
        this.fecInicioVinculo = fecInicioVinculo;
    }
    public Date getFecFinVinculo() {
        return this.fecFinVinculo;
    }
    
    public void setFecFinVinculo(Date fecFinVinculo) {
        this.fecFinVinculo = fecFinVinculo;
    }




}


