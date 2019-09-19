package com.pojos;
// Generated Sep 19, 2019 6:21:09 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * PerAlumno generated by hbm2java
 */
public class PerAlumno  implements java.io.Serializable {


     private int idPerAlumno;
     private EstadoAlumno estadoAlumno;
     private Persona persona;
     private TipoPerAlumno tipoPerAlumno;
     private int codigoAlumno;
     private String grupoSanguineo;
     private String nombreIeAnterior;
     private String lenguaMaterna;
     private String segundaLengua;
     private int nroHermanos;
     private Double refPonderadoAnterior;
     private char refGradoAnterior;
     private Character refSeccionAnterior;
     private Boolean flgTercioSuperior;
     private boolean flgCopiaDni;
     private boolean flgViveConPadres;
     private Set<Religion> religions = new HashSet<Religion>(0);
     private Set<VinculoFamiliar> vinculoFamiliars = new HashSet<VinculoFamiliar>(0);
     private Set<Enfermedad> enfermedads = new HashSet<Enfermedad>(0);
     private Set<AlumnoHasAsignacion> alumnoHasAsignacions = new HashSet<AlumnoHasAsignacion>(0);
     private Set<Alergia> alergias = new HashSet<Alergia>(0);
     private Set<Discapacidad> discapacidads = new HashSet<Discapacidad>(0);

    public PerAlumno() {
    }

	
    public PerAlumno(int idPerAlumno, EstadoAlumno estadoAlumno, Persona persona, TipoPerAlumno tipoPerAlumno, int codigoAlumno, String grupoSanguineo, String lenguaMaterna, int nroHermanos, char refGradoAnterior, boolean flgCopiaDni, boolean flgViveConPadres) {
        this.idPerAlumno = idPerAlumno;
        this.estadoAlumno = estadoAlumno;
        this.persona = persona;
        this.tipoPerAlumno = tipoPerAlumno;
        this.codigoAlumno = codigoAlumno;
        this.grupoSanguineo = grupoSanguineo;
        this.lenguaMaterna = lenguaMaterna;
        this.nroHermanos = nroHermanos;
        this.refGradoAnterior = refGradoAnterior;
        this.flgCopiaDni = flgCopiaDni;
        this.flgViveConPadres = flgViveConPadres;
    }
    public PerAlumno(int idPerAlumno, EstadoAlumno estadoAlumno, Persona persona, TipoPerAlumno tipoPerAlumno, int codigoAlumno, String grupoSanguineo, String nombreIeAnterior, String lenguaMaterna, String segundaLengua, int nroHermanos, Double refPonderadoAnterior, char refGradoAnterior, Character refSeccionAnterior, Boolean flgTercioSuperior, boolean flgCopiaDni, boolean flgViveConPadres, Set<Religion> religions, Set<VinculoFamiliar> vinculoFamiliars, Set<Enfermedad> enfermedads, Set<AlumnoHasAsignacion> alumnoHasAsignacions, Set<Alergia> alergias, Set<Discapacidad> discapacidads) {
       this.idPerAlumno = idPerAlumno;
       this.estadoAlumno = estadoAlumno;
       this.persona = persona;
       this.tipoPerAlumno = tipoPerAlumno;
       this.codigoAlumno = codigoAlumno;
       this.grupoSanguineo = grupoSanguineo;
       this.nombreIeAnterior = nombreIeAnterior;
       this.lenguaMaterna = lenguaMaterna;
       this.segundaLengua = segundaLengua;
       this.nroHermanos = nroHermanos;
       this.refPonderadoAnterior = refPonderadoAnterior;
       this.refGradoAnterior = refGradoAnterior;
       this.refSeccionAnterior = refSeccionAnterior;
       this.flgTercioSuperior = flgTercioSuperior;
       this.flgCopiaDni = flgCopiaDni;
       this.flgViveConPadres = flgViveConPadres;
       this.religions = religions;
       this.vinculoFamiliars = vinculoFamiliars;
       this.enfermedads = enfermedads;
       this.alumnoHasAsignacions = alumnoHasAsignacions;
       this.alergias = alergias;
       this.discapacidads = discapacidads;
    }
   
    public int getIdPerAlumno() {
        return this.idPerAlumno;
    }
    
    public void setIdPerAlumno(int idPerAlumno) {
        this.idPerAlumno = idPerAlumno;
    }
    public EstadoAlumno getEstadoAlumno() {
        return this.estadoAlumno;
    }
    
    public void setEstadoAlumno(EstadoAlumno estadoAlumno) {
        this.estadoAlumno = estadoAlumno;
    }
    public Persona getPersona() {
        return this.persona;
    }
    
    public void setPersona(Persona persona) {
        this.persona = persona;
    }
    public TipoPerAlumno getTipoPerAlumno() {
        return this.tipoPerAlumno;
    }
    
    public void setTipoPerAlumno(TipoPerAlumno tipoPerAlumno) {
        this.tipoPerAlumno = tipoPerAlumno;
    }
    public int getCodigoAlumno() {
        return this.codigoAlumno;
    }
    
    public void setCodigoAlumno(int codigoAlumno) {
        this.codigoAlumno = codigoAlumno;
    }
    public String getGrupoSanguineo() {
        return this.grupoSanguineo;
    }
    
    public void setGrupoSanguineo(String grupoSanguineo) {
        this.grupoSanguineo = grupoSanguineo;
    }
    public String getNombreIeAnterior() {
        return this.nombreIeAnterior;
    }
    
    public void setNombreIeAnterior(String nombreIeAnterior) {
        this.nombreIeAnterior = nombreIeAnterior;
    }
    public String getLenguaMaterna() {
        return this.lenguaMaterna;
    }
    
    public void setLenguaMaterna(String lenguaMaterna) {
        this.lenguaMaterna = lenguaMaterna;
    }
    public String getSegundaLengua() {
        return this.segundaLengua;
    }
    
    public void setSegundaLengua(String segundaLengua) {
        this.segundaLengua = segundaLengua;
    }
    public int getNroHermanos() {
        return this.nroHermanos;
    }
    
    public void setNroHermanos(int nroHermanos) {
        this.nroHermanos = nroHermanos;
    }
    public Double getRefPonderadoAnterior() {
        return this.refPonderadoAnterior;
    }
    
    public void setRefPonderadoAnterior(Double refPonderadoAnterior) {
        this.refPonderadoAnterior = refPonderadoAnterior;
    }
    public char getRefGradoAnterior() {
        return this.refGradoAnterior;
    }
    
    public void setRefGradoAnterior(char refGradoAnterior) {
        this.refGradoAnterior = refGradoAnterior;
    }
    public Character getRefSeccionAnterior() {
        return this.refSeccionAnterior;
    }
    
    public void setRefSeccionAnterior(Character refSeccionAnterior) {
        this.refSeccionAnterior = refSeccionAnterior;
    }
    public Boolean getFlgTercioSuperior() {
        return this.flgTercioSuperior;
    }
    
    public void setFlgTercioSuperior(Boolean flgTercioSuperior) {
        this.flgTercioSuperior = flgTercioSuperior;
    }
    public boolean isFlgCopiaDni() {
        return this.flgCopiaDni;
    }
    
    public void setFlgCopiaDni(boolean flgCopiaDni) {
        this.flgCopiaDni = flgCopiaDni;
    }
    public boolean isFlgViveConPadres() {
        return this.flgViveConPadres;
    }
    
    public void setFlgViveConPadres(boolean flgViveConPadres) {
        this.flgViveConPadres = flgViveConPadres;
    }
    public Set<Religion> getReligions() {
        return this.religions;
    }
    
    public void setReligions(Set<Religion> religions) {
        this.religions = religions;
    }
    public Set<VinculoFamiliar> getVinculoFamiliars() {
        return this.vinculoFamiliars;
    }
    
    public void setVinculoFamiliars(Set<VinculoFamiliar> vinculoFamiliars) {
        this.vinculoFamiliars = vinculoFamiliars;
    }
    public Set<Enfermedad> getEnfermedads() {
        return this.enfermedads;
    }
    
    public void setEnfermedads(Set<Enfermedad> enfermedads) {
        this.enfermedads = enfermedads;
    }
    public Set<AlumnoHasAsignacion> getAlumnoHasAsignacions() {
        return this.alumnoHasAsignacions;
    }
    
    public void setAlumnoHasAsignacions(Set<AlumnoHasAsignacion> alumnoHasAsignacions) {
        this.alumnoHasAsignacions = alumnoHasAsignacions;
    }
    public Set<Alergia> getAlergias() {
        return this.alergias;
    }
    
    public void setAlergias(Set<Alergia> alergias) {
        this.alergias = alergias;
    }
    public Set<Discapacidad> getDiscapacidads() {
        return this.discapacidads;
    }
    
    public void setDiscapacidads(Set<Discapacidad> discapacidads) {
        this.discapacidads = discapacidads;
    }




}


