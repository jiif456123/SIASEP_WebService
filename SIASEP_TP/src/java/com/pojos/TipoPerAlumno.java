package com.pojos;
// Generated Sep 19, 2019 6:21:09 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * TipoPerAlumno generated by hbm2java
 */
public class TipoPerAlumno  implements java.io.Serializable {


     private int idTipoPerAlumno;
     private String nomTipoPerAlumno;
     private Set<PerAlumno> perAlumnos = new HashSet<PerAlumno>(0);

    public TipoPerAlumno() {
    }

	
    public TipoPerAlumno(int idTipoPerAlumno) {
        this.idTipoPerAlumno = idTipoPerAlumno;
    }
    public TipoPerAlumno(int idTipoPerAlumno, String nomTipoPerAlumno, Set<PerAlumno> perAlumnos) {
       this.idTipoPerAlumno = idTipoPerAlumno;
       this.nomTipoPerAlumno = nomTipoPerAlumno;
       this.perAlumnos = perAlumnos;
    }
   
    public int getIdTipoPerAlumno() {
        return this.idTipoPerAlumno;
    }
    
    public void setIdTipoPerAlumno(int idTipoPerAlumno) {
        this.idTipoPerAlumno = idTipoPerAlumno;
    }
    public String getNomTipoPerAlumno() {
        return this.nomTipoPerAlumno;
    }
    
    public void setNomTipoPerAlumno(String nomTipoPerAlumno) {
        this.nomTipoPerAlumno = nomTipoPerAlumno;
    }
    public Set<PerAlumno> getPerAlumnos() {
        return this.perAlumnos;
    }
    
    public void setPerAlumnos(Set<PerAlumno> perAlumnos) {
        this.perAlumnos = perAlumnos;
    }




}


