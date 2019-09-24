package com.DTO;

import java.util.Date;

public class LoginDTO {

    Integer id_usuario;
    Integer fkid_persona;
    Integer fkid_estado_usuario;
    String username;
    String password;
    Date fec_creacion;
    Integer respuesta;

    Integer id_persona;
    Integer fkid_tipo_documento;
    Integer fkid_distrito;
    String primer_nombre;
    String apellido_materno;
    String apellido_paterno;
    String numero_documento;
    String fec_nacimiento;
    String lugar_nacimiento;
    char sexo;
    String telefono_casa;
    String telefono_celular;
    String direccion;
    String correo;

    Integer id_multi_role;
    Integer fkid_usuario;
    Integer fkid_tipo_usuario;
    
    Integer id_tipo_usuario;
    String nom_tipo_usuario;
    String dscrp_tipo_usuario;

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Integer getFkid_persona() {
        return fkid_persona;
    }

    public void setFkid_persona(Integer fkid_persona) {
        this.fkid_persona = fkid_persona;
    }

    public Integer getFkid_estado_usuario() {
        return fkid_estado_usuario;
    }

    public void setFkid_estado_usuario(Integer fkid_estado_usuario) {
        this.fkid_estado_usuario = fkid_estado_usuario;
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

    public Integer getId_persona() {
        return id_persona;
    }

    public void setId_persona(Integer id_persona) {
        this.id_persona = id_persona;
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

    public Integer getId_multi_role() {
        return id_multi_role;
    }

    public void setId_multi_role(Integer id_multi_role) {
        this.id_multi_role = id_multi_role;
    }

    public Integer getFkid_usuario() {
        return fkid_usuario;
    }

    public void setFkid_usuario(Integer fkid_usuario) {
        this.fkid_usuario = fkid_usuario;
    }

    public Integer getFkid_tipo_usuario() {
        return fkid_tipo_usuario;
    }

    public void setFkid_tipo_usuario(Integer fkid_tipo_usuario) {
        this.fkid_tipo_usuario = fkid_tipo_usuario;
    }

    public Integer getId_tipo_usuario() {
        return id_tipo_usuario;
    }

    public void setId_tipo_usuario(Integer id_tipo_usuario) {
        this.id_tipo_usuario = id_tipo_usuario;
    }

    public String getNom_tipo_usuario() {
        return nom_tipo_usuario;
    }

    public void setNom_tipo_usuario(String nom_tipo_usuario) {
        this.nom_tipo_usuario = nom_tipo_usuario;
    }

    public String getDscrp_tipo_usuario() {
        return dscrp_tipo_usuario;
    }

    public void setDscrp_tipo_usuario(String dscrp_tipo_usuario) {
        this.dscrp_tipo_usuario = dscrp_tipo_usuario;
    }
    
    public Integer getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Integer respuesta) {
        this.respuesta = respuesta;
    }

    @Override
    public String toString() {
        return "LoginDTO{" + "id_usuario=" + id_usuario + ", fkid_persona=" + fkid_persona + ", fkid_estado_usuario=" + fkid_estado_usuario + ", username=" + username + ", password=" + password + ", fec_creacion=" + fec_creacion + ", id_persona=" + id_persona + ", fkid_tipo_documento=" + fkid_tipo_documento + ", fkid_distrito=" + fkid_distrito + ", primer_nombre=" + primer_nombre + ", apellido_materno=" + apellido_materno + ", apellido_paterno=" + apellido_paterno + ", numero_documento=" + numero_documento + ", fec_nacimiento=" + fec_nacimiento + ", lugar_nacimiento=" + lugar_nacimiento + ", sexo=" + sexo + ", telefono_casa=" + telefono_casa + ", telefono_celular=" + telefono_celular + ", direccion=" + direccion + ", correo=" + correo + ", id_multi_role=" + id_multi_role + ", fkid_usuario=" + fkid_usuario + ", fkid_tipo_usuario=" + fkid_tipo_usuario + ", id_tipo_usuario=" + id_tipo_usuario + ", nom_tipo_usuario=" + nom_tipo_usuario + ", dscrp_tipo_usuario=" + dscrp_tipo_usuario + '}';
    }

    
}
