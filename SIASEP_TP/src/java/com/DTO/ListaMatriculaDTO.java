package com.DTO;

import java.util.Date;

public class ListaMatriculaDTO {

    Integer id_persona;
    String primer_nombre;
    String apellido_materno;
    String apellido_paterno;
    String numero_documento;
    Date fec_nacimiento;
    String lugar_nacimiento;
    char sexo;
    String telefono_casa;
    String telefono_celular;
    String direccion;
    String correo;
    Integer fkid_tipo_documento;
    Integer fkid_distrito;
    
    Integer id_per_alumno;
    Integer codigo_alumno;
    String grupo_sanguineo;
    String nombre_ie_anterior;
    String lengua_materna;
    String segunda_lengua;
    Integer nro_hermanos;
    double ref_ponderado_anterior;
    char ref_grado_anterior;
    char ref_seccion_anterior;
    Integer flg_tercio_superior;
    Integer flg_copia_dni;
    Integer flg_vive_con_padres;
    Integer fkid_persona;
    Integer fkid_estado_alumno;
    Integer fkid_tipo_per_alumno;
    
    Integer id_distrito;
    String nom_distrito;
    
    Integer id_estado_alumno;
    String nom_estado_alumno;

    public Integer getId_persona() {
        return id_persona;
    }

    public void setId_persona(Integer id_persona) {
        this.id_persona = id_persona;
    }

    public String getPrimer_nombre() {
        return primer_nombre;
    }

    public void setPrimer_nombre(String primer_nombre) {
        this.primer_nombre = primer_nombre;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getNumero_documento() {
        return numero_documento;
    }

    public void setNumero_documento(String numero_documento) {
        this.numero_documento = numero_documento;
    }

    public Date getFec_nacimiento() {
        return fec_nacimiento;
    }

    public void setFec_nacimiento(Date fec_nacimiento) {
        this.fec_nacimiento = fec_nacimiento;
    }

    public String getLugar_nacimiento() {
        return lugar_nacimiento;
    }

    public void setLugar_nacimiento(String lugar_nacimiento) {
        this.lugar_nacimiento = lugar_nacimiento;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public String getTelefono_casa() {
        return telefono_casa;
    }

    public void setTelefono_casa(String telefono_casa) {
        this.telefono_casa = telefono_casa;
    }

    public String getTelefono_celular() {
        return telefono_celular;
    }

    public void setTelefono_celular(String telefono_celular) {
        this.telefono_celular = telefono_celular;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Integer getFkid_tipo_documento() {
        return fkid_tipo_documento;
    }

    public void setFkid_tipo_documento(Integer fkid_tipo_documento) {
        this.fkid_tipo_documento = fkid_tipo_documento;
    }

    public Integer getFkid_distrito() {
        return fkid_distrito;
    }

    public void setFkid_distrito(Integer fkid_distrito) {
        this.fkid_distrito = fkid_distrito;
    }

    public Integer getId_per_alumno() {
        return id_per_alumno;
    }

    public void setId_per_alumno(Integer id_per_alumno) {
        this.id_per_alumno = id_per_alumno;
    }

    public Integer getCodigo_alumno() {
        return codigo_alumno;
    }

    public void setCodigo_alumno(Integer codigo_alumno) {
        this.codigo_alumno = codigo_alumno;
    }

    public String getGrupo_sanguineo() {
        return grupo_sanguineo;
    }

    public void setGrupo_sanguineo(String grupo_sanguineo) {
        this.grupo_sanguineo = grupo_sanguineo;
    }

    public String getNombre_ie_anterior() {
        return nombre_ie_anterior;
    }

    public void setNombre_ie_anterior(String nombre_ie_anterior) {
        this.nombre_ie_anterior = nombre_ie_anterior;
    }

    public String getLengua_materna() {
        return lengua_materna;
    }

    public void setLengua_materna(String lengua_materna) {
        this.lengua_materna = lengua_materna;
    }

    public String getSegunda_lengua() {
        return segunda_lengua;
    }

    public void setSegunda_lengua(String segunda_lengua) {
        this.segunda_lengua = segunda_lengua;
    }

    public Integer getNro_hermanos() {
        return nro_hermanos;
    }

    public void setNro_hermanos(Integer nro_hermanos) {
        this.nro_hermanos = nro_hermanos;
    }

    public double getRef_ponderado_anterior() {
        return ref_ponderado_anterior;
    }

    public void setRef_ponderado_anterior(double ref_ponderado_anterior) {
        this.ref_ponderado_anterior = ref_ponderado_anterior;
    }

    public char getRef_grado_anterior() {
        return ref_grado_anterior;
    }

    public void setRef_grado_anterior(char ref_grado_anterior) {
        this.ref_grado_anterior = ref_grado_anterior;
    }

    public char getRef_seccion_anterior() {
        return ref_seccion_anterior;
    }

    public void setRef_seccion_anterior(char ref_seccion_anterior) {
        this.ref_seccion_anterior = ref_seccion_anterior;
    }

    public Integer getFlg_tercio_superior() {
        return flg_tercio_superior;
    }

    public void setFlg_tercio_superior(Integer flg_tercio_superior) {
        this.flg_tercio_superior = flg_tercio_superior;
    }

    public Integer getFlg_copia_dni() {
        return flg_copia_dni;
    }

    public void setFlg_copia_dni(Integer flg_copia_dni) {
        this.flg_copia_dni = flg_copia_dni;
    }

    public Integer getFlg_vive_con_padres() {
        return flg_vive_con_padres;
    }

    public void setFlg_vive_con_padres(Integer flg_vive_con_padres) {
        this.flg_vive_con_padres = flg_vive_con_padres;
    }

    public Integer getFkid_persona() {
        return fkid_persona;
    }

    public void setFkid_persona(Integer fkid_persona) {
        this.fkid_persona = fkid_persona;
    }

    public Integer getFkid_estado_alumno() {
        return fkid_estado_alumno;
    }

    public void setFkid_estado_alumno(Integer fkid_estado_alumno) {
        this.fkid_estado_alumno = fkid_estado_alumno;
    }

    public Integer getFkid_tipo_per_alumno() {
        return fkid_tipo_per_alumno;
    }

    public void setFkid_tipo_per_alumno(Integer fkid_tipo_per_alumno) {
        this.fkid_tipo_per_alumno = fkid_tipo_per_alumno;
    }

    public Integer getId_distrito() {
        return id_distrito;
    }

    public void setId_distrito(Integer id_distrito) {
        this.id_distrito = id_distrito;
    }

    public String getNom_distrito() {
        return nom_distrito;
    }

    public void setNom_distrito(String nom_distrito) {
        this.nom_distrito = nom_distrito;
    }

    public Integer getId_estado_alumno() {
        return id_estado_alumno;
    }

    public void setId_estado_alumno(Integer id_estado_alumno) {
        this.id_estado_alumno = id_estado_alumno;
    }

    public String getNom_estado_alumno() {
        return nom_estado_alumno;
    }

    public void setNom_estado_alumno(String nom_estado_alumno) {
        this.nom_estado_alumno = nom_estado_alumno;
    }

    @Override
    public String toString() {
        return "ListaMatriculaDTO{" + "id_persona=" + id_persona + ", primer_nombre=" + primer_nombre + ", apellido_materno=" + apellido_materno + ", apellido_paterno=" + apellido_paterno + ", numero_documento=" + numero_documento + ", fec_nacimiento=" + fec_nacimiento + ", lugar_nacimiento=" + lugar_nacimiento + ", sexo=" + sexo + ", telefono_casa=" + telefono_casa + ", telefono_celular=" + telefono_celular + ", direccion=" + direccion + ", correo=" + correo + ", fkid_tipo_documento=" + fkid_tipo_documento + ", fkid_distrito=" + fkid_distrito + ", id_per_alumno=" + id_per_alumno + ", codigo_alumno=" + codigo_alumno + ", grupo_sanguineo=" + grupo_sanguineo + ", nombre_ie_anterior=" + nombre_ie_anterior + ", lengua_materna=" + lengua_materna + ", segunda_lengua=" + segunda_lengua + ", nro_hermanos=" + nro_hermanos + ", ref_ponderado_anterior=" + ref_ponderado_anterior + ", ref_grado_anterior=" + ref_grado_anterior + ", ref_seccion_anterior=" + ref_seccion_anterior + ", flg_tercio_superior=" + flg_tercio_superior + ", flg_copia_dni=" + flg_copia_dni + ", flg_vive_con_padres=" + flg_vive_con_padres + ", fkid_persona=" + fkid_persona + ", fkid_estado_alumno=" + fkid_estado_alumno + ", fkid_tipo_per_alumno=" + fkid_tipo_per_alumno + ", id_distrito=" + id_distrito + ", nom_distrito=" + nom_distrito + ", id_estado_alumno=" + id_estado_alumno + ", nom_estado_alumno=" + nom_estado_alumno + '}';
    }
    
    
}
