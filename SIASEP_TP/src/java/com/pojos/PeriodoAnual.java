package com.pojos;
// Generated Oct 20, 2019 2:02:36 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * PeriodoAnual generated by hbm2java
 */
public class PeriodoAnual  implements java.io.Serializable {


     private int idPeriodoAnual;
     private Date fecInicioAnual;
     private Date fecFinAnual;
     private Set<Matricula> matriculas = new HashSet<Matricula>(0);

    public PeriodoAnual() {
    }

	
    public PeriodoAnual(int idPeriodoAnual, Date fecInicioAnual) {
        this.idPeriodoAnual = idPeriodoAnual;
        this.fecInicioAnual = fecInicioAnual;
    }
    public PeriodoAnual(int idPeriodoAnual, Date fecInicioAnual, Date fecFinAnual, Set<Matricula> matriculas) {
       this.idPeriodoAnual = idPeriodoAnual;
       this.fecInicioAnual = fecInicioAnual;
       this.fecFinAnual = fecFinAnual;
       this.matriculas = matriculas;
    }
   
    public int getIdPeriodoAnual() {
        return this.idPeriodoAnual;
    }
    
    public void setIdPeriodoAnual(int idPeriodoAnual) {
        this.idPeriodoAnual = idPeriodoAnual;
    }
    public Date getFecInicioAnual() {
        return this.fecInicioAnual;
    }
    
    public void setFecInicioAnual(Date fecInicioAnual) {
        this.fecInicioAnual = fecInicioAnual;
    }
    public Date getFecFinAnual() {
        return this.fecFinAnual;
    }
    
    public void setFecFinAnual(Date fecFinAnual) {
        this.fecFinAnual = fecFinAnual;
    }
    public Set<Matricula> getMatriculas() {
        return this.matriculas;
    }
    
    public void setMatriculas(Set<Matricula> matriculas) {
        this.matriculas = matriculas;
    }




}


