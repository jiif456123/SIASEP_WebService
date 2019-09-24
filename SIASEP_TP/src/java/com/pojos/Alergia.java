package com.pojos;
// Generated Sep 22, 2019 11:27:50 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Alergia generated by hbm2java
 */
public class Alergia  implements java.io.Serializable {


     private int idAlergia;
     private String nomAlergia;
     private Set<PerAlumno> perAlumnos = new HashSet<PerAlumno>(0);

    public Alergia() {
    }

	
    public Alergia(int idAlergia) {
        this.idAlergia = idAlergia;
    }
    public Alergia(int idAlergia, String nomAlergia, Set<PerAlumno> perAlumnos) {
       this.idAlergia = idAlergia;
       this.nomAlergia = nomAlergia;
       this.perAlumnos = perAlumnos;
    }
   
    public int getIdAlergia() {
        return this.idAlergia;
    }
    
    public void setIdAlergia(int idAlergia) {
        this.idAlergia = idAlergia;
    }
    public String getNomAlergia() {
        return this.nomAlergia;
    }
    
    public void setNomAlergia(String nomAlergia) {
        this.nomAlergia = nomAlergia;
    }
    public Set<PerAlumno> getPerAlumnos() {
        return this.perAlumnos;
    }
    
    public void setPerAlumnos(Set<PerAlumno> perAlumnos) {
        this.perAlumnos = perAlumnos;
    }




}


