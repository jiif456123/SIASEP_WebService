package com.DTO;

import java.util.Date;

public class MatriculaDTO {
    
    Integer id_matricula;
    String codigo_matricula;
    String fec_realizada;
    Integer fkid_per_alumno;
    Integer fkid_estado_matricula;
    Integer fkid_periodo_anual;

    Integer id_per_trabajador;
    Integer codigo_trabajador;
    Integer fkid_tipo_trabajador;
    
    Integer id_historial_matricula;
    String fec_modificacion;
    String dscrp_observacion;
    Integer fkid_matricula;
    Integer fkid_per_trabajador;
    
    Integer id_usuario;
    String username;
    String password;
    Date fec_creacion;
    Integer fkid_estado_usuario;
    
    Integer id_per_alumno;
    Integer codigo_alumno;
    String nombre_ie_anterior;
    String ref_nivel;
    char ref_grado_anterior;
    char ref_seccion;
    double ref_ponderado_anterior;
    boolean flg_tercio_superior;
    String grupo_sanguineo;
    String lengua_materna;
    String segunda_lengua;
    Integer nro_hermanos;
    boolean flg_copia_dni;
    boolean flg_vive_con_padres;
    boolean flg_foto_alumno;
    Integer fkid_persona;
    Integer fkid_tipo_alumno;
    
    Integer id_persona;
    String primer_nombre;
    String apellido_materno;
    String apellido_paterno;
    String numero_documento;
    Date fec_nacimiento;
    char sexo;
    String telefono_casa;
    String telefono_celular;
    String direccion;
    String correo;
    Integer fkid_tipo_documento;
    Integer fkid_distrito;
    
    Integer id_estado_matricula;
    String nom_estado_matricula;

    Integer id_periodo_anual;
    Date fec_inicio_anual;
    Date fec_fin_anual;

    public Integer getId_matricula() {
        return id_matricula;
    }

    public void setId_matricula(Integer id_matricula) {
        this.id_matricula = id_matricula;
    }

    public String getCodigo_matricula() {
        return codigo_matricula;
    }

    public void setCodigo_matricula(String codigo_matricula) {
        this.codigo_matricula = codigo_matricula;
    }

    public String getFec_realizada() {
        return fec_realizada;
    }

    public void setFec_realizada(String fec_realizada) {
        this.fec_realizada = fec_realizada;
    }

    public Integer getFkid_per_alumno() {
        return fkid_per_alumno;
    }

    public void setFkid_per_alumno(Integer fkid_per_alumno) {
        this.fkid_per_alumno = fkid_per_alumno;
    }

    public Integer getFkid_estado_matricula() {
        return fkid_estado_matricula;
    }

    public void setFkid_estado_matricula(Integer fkid_estado_matricula) {
        this.fkid_estado_matricula = fkid_estado_matricula;
    }

    public Integer getFkid_periodo_anual() {
        return fkid_periodo_anual;
    }

    public void setFkid_periodo_anual(Integer fkid_periodo_anual) {
        this.fkid_periodo_anual = fkid_periodo_anual;
    }

    public Integer getId_per_trabajador() {
        return id_per_trabajador;
    }

    public void setId_per_trabajador(Integer id_per_trabajador) {
        this.id_per_trabajador = id_per_trabajador;
    }

    public Integer getCodigo_trabajador() {
        return codigo_trabajador;
    }

    public void setCodigo_trabajador(Integer codigo_trabajador) {
        this.codigo_trabajador = codigo_trabajador;
    }

    public Integer getFkid_tipo_trabajador() {
        return fkid_tipo_trabajador;
    }

    public void setFkid_tipo_trabajador(Integer fkid_tipo_trabajador) {
        this.fkid_tipo_trabajador = fkid_tipo_trabajador;
    }

    public Integer getId_historial_matricula() {
        return id_historial_matricula;
    }

    public void setId_historial_matricula(Integer id_historial_matricula) {
        this.id_historial_matricula = id_historial_matricula;
    }

    public String getFec_modificacion() {
        return fec_modificacion;
    }

    public void setFec_modificacion(String fec_modificacion) {
        this.fec_modificacion = fec_modificacion;
    }

    public String getDscrp_observacion() {
        return dscrp_observacion;
    }

    public void setDscrp_observacion(String dscrp_observacion) {
        this.dscrp_observacion = dscrp_observacion;
    }

    public Integer getFkid_matricula() {
        return fkid_matricula;
    }

    public void setFkid_matricula(Integer fkid_matricula) {
        this.fkid_matricula = fkid_matricula;
    }

    public Integer getFkid_per_trabajador() {
        return fkid_per_trabajador;
    }

    public void setFkid_per_trabajador(Integer fkid_per_trabajador) {
        this.fkid_per_trabajador = fkid_per_trabajador;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getFec_creacion() {
        return fec_creacion;
    }

    public void setFec_creacion(Date fec_creacion) {
        this.fec_creacion = fec_creacion;
    }

    public Integer getFkid_estado_usuario() {
        return fkid_estado_usuario;
    }

    public void setFkid_estado_usuario(Integer fkid_estado_usuario) {
        this.fkid_estado_usuario = fkid_estado_usuario;
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

    public double getRef_ponderado_anterior() {
        return ref_ponderado_anterior;
    }

    public void setRef_ponderado_anterior(double ref_ponderado_anterior) {
        this.ref_ponderado_anterior = ref_ponderado_anterior;
    }

    public boolean isFlg_tercio_superior() {
        return flg_tercio_superior;
    }

    public void setFlg_tercio_superior(boolean flg_tercio_superior) {
        this.flg_tercio_superior = flg_tercio_superior;
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

    public boolean isFlg_copia_dni() {
        return flg_copia_dni;
    }

    public void setFlg_copia_dni(boolean flg_copia_dni) {
        this.flg_copia_dni = flg_copia_dni;
    }

    public boolean isFlg_vive_con_padres() {
        return flg_vive_con_padres;
    }

    public void setFlg_vive_con_padres(boolean flg_vive_con_padres) {
        this.flg_vive_con_padres = flg_vive_con_padres;
    }

    public boolean isFlg_foto_alumno() {
        return flg_foto_alumno;
    }

    public void setFlg_foto_alumno(boolean flg_foto_alumno) {
        this.flg_foto_alumno = flg_foto_alumno;
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

    public Integer getId_estado_matricula() {
        return id_estado_matricula;
    }

    public void setId_estado_matricula(Integer id_estado_matricula) {
        this.id_estado_matricula = id_estado_matricula;
    }

    public String getNom_estado_matricula() {
        return nom_estado_matricula;
    }

    public void setNom_estado_matricula(String nom_estado_matricula) {
        this.nom_estado_matricula = nom_estado_matricula;
    }

    public Integer getId_periodo_anual() {
        return id_periodo_anual;
    }

    public void setId_periodo_anual(Integer id_periodo_anual) {
        this.id_periodo_anual = id_periodo_anual;
    }

    public Date getFec_inicio_anual() {
        return fec_inicio_anual;
    }

    public void setFec_inicio_anual(Date fec_inicio_anual) {
        this.fec_inicio_anual = fec_inicio_anual;
    }

    public Date getFec_fin_anual() {
        return fec_fin_anual;
    }

    public void setFec_fin_anual(Date fec_fin_anual) {
        this.fec_fin_anual = fec_fin_anual;
    }

    @Override
    public String toString() {
        return "MatriculaDTO{" + "id_matricula=" + id_matricula + ", codigo_matricula=" + codigo_matricula + ", fec_realizada=" + fec_realizada + ", fkid_per_alumno=" + fkid_per_alumno + ", fkid_estado_matricula=" + fkid_estado_matricula + ", fkid_periodo_anual=" + fkid_periodo_anual + ", id_per_trabajador=" + id_per_trabajador + ", codigo_trabajador=" + codigo_trabajador + ", fkid_tipo_trabajador=" + fkid_tipo_trabajador + ", id_historial_matricula=" + id_historial_matricula + ", fec_modificacion=" + fec_modificacion + ", dscrp_observacion=" + dscrp_observacion + ", fkid_matricula=" + fkid_matricula + ", fkid_per_trabajador=" + fkid_per_trabajador + ", id_usuario=" + id_usuario + ", username=" + username + ", password=" + password + ", fec_creacion=" + fec_creacion + ", fkid_estado_usuario=" + fkid_estado_usuario + ", id_per_alumno=" + id_per_alumno + ", codigo_alumno=" + codigo_alumno + ", nombre_ie_anterior=" + nombre_ie_anterior + ", ref_nivel=" + ref_nivel + ", ref_grado_anterior=" + ref_grado_anterior + ", ref_seccion=" + ref_seccion + ", ref_ponderado_anterior=" + ref_ponderado_anterior + ", flg_tercio_superior=" + flg_tercio_superior + ", grupo_sanguineo=" + grupo_sanguineo + ", lengua_materna=" + lengua_materna + ", segunda_lengua=" + segunda_lengua + ", nro_hermanos=" + nro_hermanos + ", flg_copia_dni=" + flg_copia_dni + ", flg_vive_con_padres=" + flg_vive_con_padres + ", flg_foto_alumno=" + flg_foto_alumno + ", fkid_persona=" + fkid_persona + ", fkid_tipo_alumno=" + fkid_tipo_alumno + ", id_persona=" + id_persona + ", primer_nombre=" + primer_nombre + ", apellido_materno=" + apellido_materno + ", apellido_paterno=" + apellido_paterno + ", numero_documento=" + numero_documento + ", fec_nacimiento=" + fec_nacimiento + ", sexo=" + sexo + ", telefono_casa=" + telefono_casa + ", telefono_celular=" + telefono_celular + ", direccion=" + direccion + ", correo=" + correo + ", fkid_tipo_documento=" + fkid_tipo_documento + ", fkid_distrito=" + fkid_distrito + ", id_estado_matricula=" + id_estado_matricula + ", nom_estado_matricula=" + nom_estado_matricula + ", id_periodo_anual=" + id_periodo_anual + ", fec_inicio_anual=" + fec_inicio_anual + ", fec_fin_anual=" + fec_fin_anual + '}';
    }

    
}
