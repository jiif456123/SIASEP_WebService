package com.DTO;

public class AlumnoDTO {
    
    Integer id_persona;
    String primer_nombre;
    String apellido_materno;
    String apellido_paterno;
    String numero_documento;
    String fec_nacimiento;
    char sexo;
    String telefono_casa;
    String telefono_celular;
    String direccion;
    String correo;
    Integer fkid_tipo_documento;
    Integer fkid_distrito;
    Integer fkid_lugar_nacimiento;
    String nombre_alumno;
    
    Integer id_distrito;
    String nom_distrito;
    
    Integer id_lugar_nacimiento;
    String nom_lugar_nacimiento;
    
    Integer id_tipo_documento;
    String nom_tipo_documento;
    
    Integer id_per_alumno;
    Integer codigo_alumno;
    String nombre_ie_anterior;
    String ref_nivel;
    char ref_grado_anterior;
    char ref_seccion;
    float ref_ponderado_anterior;
    boolean flg_orden_merito;
    String grupo_sanguineo;
    String lengua_materna;
    String segunda_lengua;
    Integer nro_hermanos;
    boolean flg_copia_dni;
    boolean flg_vive_con_padres;
    Integer fkid_persona;
    Integer fkid_tipo_alumno;

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

    public String getFec_nacimiento() {
        return fec_nacimiento;
    }

    public void setFec_nacimiento(String fec_nacimiento) {
        this.fec_nacimiento = fec_nacimiento;
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

    public Integer getFkid_lugar_nacimiento() {
        return fkid_lugar_nacimiento;
    }

    public void setFkid_lugar_nacimiento(Integer fkid_lugar_nacimiento) {
        this.fkid_lugar_nacimiento = fkid_lugar_nacimiento;
    }

    public String getNombre_alumno() {
        return nombre_alumno;
    }

    public void setNombre_alumno(String nombre_alumno) {
        this.nombre_alumno = nombre_alumno;
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

    public Integer getId_lugar_nacimiento() {
        return id_lugar_nacimiento;
    }

    public void setId_lugar_nacimiento(Integer id_lugar_nacimiento) {
        this.id_lugar_nacimiento = id_lugar_nacimiento;
    }

    public String getNom_lugar_nacimiento() {
        return nom_lugar_nacimiento;
    }

    public void setNom_lugar_nacimiento(String nom_lugar_nacimiento) {
        this.nom_lugar_nacimiento = nom_lugar_nacimiento;
    }

    public Integer getId_tipo_documento() {
        return id_tipo_documento;
    }

    public void setId_tipo_documento(Integer id_tipo_documento) {
        this.id_tipo_documento = id_tipo_documento;
    }

    public String getNom_tipo_documento() {
        return nom_tipo_documento;
    }

    public void setNom_tipo_documento(String nom_tipo_documento) {
        this.nom_tipo_documento = nom_tipo_documento;
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

    public String getNombre_ie_anterior() {
        return nombre_ie_anterior;
    }

    public void setNombre_ie_anterior(String nombre_ie_anterior) {
        this.nombre_ie_anterior = nombre_ie_anterior;
    }

    public String getRef_nivel() {
        return ref_nivel;
    }

    public void setRef_nivel(String ref_nivel) {
        this.ref_nivel = ref_nivel;
    }

    public char getRef_grado_anterior() {
        return ref_grado_anterior;
    }

    public void setRef_grado_anterior(char ref_grado_anterior) {
        this.ref_grado_anterior = ref_grado_anterior;
    }

    public char getRef_seccion() {
        return ref_seccion;
    }

    public void setRef_seccion(char ref_seccion) {
        this.ref_seccion = ref_seccion;
    }

    public float getRef_ponderado_anterior() {
        return ref_ponderado_anterior;
    }

    public void setRef_ponderado_anterior(float ref_ponderado_anterior) {
        this.ref_ponderado_anterior = ref_ponderado_anterior;
    }

    public boolean getFlg_orden_merito() {
        return flg_orden_merito;
    }

    public void setFlg_orden_merito(boolean flg_orden_merito) {
        this.flg_orden_merito = flg_orden_merito;
    }

    public String getGrupo_sanguineo() {
        return grupo_sanguineo;
    }

    public void setGrupo_sanguineo(String grupo_sanguineo) {
        this.grupo_sanguineo = grupo_sanguineo;
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

    public boolean getFlg_copia_dni() {
        return flg_copia_dni;
    }

    public void setFlg_copia_dni(boolean flg_copia_dni) {
        this.flg_copia_dni = flg_copia_dni;
    }

    public boolean getFlg_vive_con_padres() {
        return flg_vive_con_padres;
    }

    public void setFlg_vive_con_padres(boolean flg_vive_con_padres) {
        this.flg_vive_con_padres = flg_vive_con_padres;
    }

    public Integer getFkid_persona() {
        return fkid_persona;
    }

    public void setFkid_persona(Integer fkid_persona) {
        this.fkid_persona = fkid_persona;
    }

    public Integer getFkid_tipo_alumno() {
        return fkid_tipo_alumno;
    }

    public void setFkid_tipo_alumno(Integer fkid_tipo_alumno) {
        this.fkid_tipo_alumno = fkid_tipo_alumno;
    }

    @Override
    public String toString() {
        return "AlumnoDTO{" + "id_persona=" + id_persona + ", primer_nombre=" + primer_nombre + ", apellido_materno=" + apellido_materno + ", apellido_paterno=" + apellido_paterno + ", numero_documento=" + numero_documento + ", fec_nacimiento=" + fec_nacimiento + ", sexo=" + sexo + ", telefono_casa=" + telefono_casa + ", telefono_celular=" + telefono_celular + ", direccion=" + direccion + ", correo=" + correo + ", fkid_tipo_documento=" + fkid_tipo_documento + ", fkid_distrito=" + fkid_distrito + ", fkid_lugar_nacimiento=" + fkid_lugar_nacimiento + ", nombre_alumno=" + nombre_alumno + ", id_distrito=" + id_distrito + ", nom_distrito=" + nom_distrito + ", id_lugar_nacimiento=" + id_lugar_nacimiento + ", nom_lugar_nacimiento=" + nom_lugar_nacimiento + ", id_tipo_documento=" + id_tipo_documento + ", nom_tipo_documento=" + nom_tipo_documento + ", id_per_alumno=" + id_per_alumno + ", codigo_alumno=" + codigo_alumno + ", nombre_ie_anterior=" + nombre_ie_anterior + ", ref_nivel=" + ref_nivel + ", ref_grado_anterior=" + ref_grado_anterior + ", ref_seccion=" + ref_seccion + ", ref_ponderado_anterior=" + ref_ponderado_anterior + ", flg_orden_merito=" + flg_orden_merito + ", grupo_sanguineo=" + grupo_sanguineo + ", lengua_materna=" + lengua_materna + ", segunda_lengua=" + segunda_lengua + ", nro_hermanos=" + nro_hermanos + ", flg_copia_dni=" + flg_copia_dni + ", flg_vive_con_padres=" + flg_vive_con_padres + ", fkid_persona=" + fkid_persona + ", fkid_tipo_alumno=" + fkid_tipo_alumno + '}';
    }
    
}
