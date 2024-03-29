package com.service;

import com.DTO.AlumnoDTO;
import com.DTO.ListaAlumnoDTO;
import com.DTO.ListaMatriculaDTO;
import com.DTO.MatriculaDTO;
import com.DTO.VinculoFamiliarDTO;
import com.google.gson.Gson;
import com.helper.MatriculaHelper;
import com.helper.ModificaAlumnoHelper;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("directiva")
public class DirectivaResource {

    MatriculaHelper matriculaHelper;
    ModificaAlumnoHelper modificaAlumnoHelper;
    
    @Context
    private UriInfo context;

    public DirectivaResource() {
        matriculaHelper = new MatriculaHelper();
        modificaAlumnoHelper = new ModificaAlumnoHelper();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson() {
        //TODO return proper representation object
        throw new UnsupportedOperationException();
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
    
    /*-----------------------------------------------INICIO MATRICULA---------------------------------------------------*/
    
    @GET
    @Path("listaPeriodoSelect")
    @Produces("application/json")
    public String getListaPeriodoSelect(String data) {
        Gson gson =new Gson();
        List lista = null;
        try{
            lista = matriculaHelper.getListPeriodo();
            System.out.println(""+lista);
        }
        catch(Exception ex){
            System.out.println("getListaPeriodoSelect: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @POST
    @Path("refrescaListaMatrHabilitado")
    @Produces("application/json")
    public String refrescaListaMatrHabilitado(String data) {
        Gson gson =new Gson();
        List lista = null;
        ListaMatriculaDTO listaMatriculaDTO = gson.fromJson(data, ListaMatriculaDTO.class);
        try{
            lista = matriculaHelper.getListMatriculaByHabilitado(listaMatriculaDTO.getFkid_periodo_anual());
        }
        catch(Exception ex){
            System.out.println("refrescaListaMatrHabilitado: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @POST
    @Path("refrescaListaMatrDeshabilitado")
    @Produces("application/json")
    public String refrescaListaMatrDeshabilitado(String data) {
        Gson gson =new Gson();
        List lista = null;
        ListaMatriculaDTO listaMatriculaDTO = gson.fromJson(data, ListaMatriculaDTO.class);
        try{
            lista = matriculaHelper.getListMatriculaByDeshabilitado(listaMatriculaDTO.getFkid_periodo_anual());
        }
        catch(Exception ex){
            System.out.println("refrescaListaMatrDeshabilitado: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @POST
    @Path("getListaHistorialMatricula")
    @Produces("application/json")
    public String getListaHistorialMatricula(String data) {
        Gson gson =new Gson();
        List lista = null;
        ListaMatriculaDTO listaMatriculaDTO = gson.fromJson(data, ListaMatriculaDTO.class);
        try{
            lista = matriculaHelper.getListHistorialMatricula(listaMatriculaDTO.getId_usuario());
        }
        catch(Exception ex){
            System.out.println("getListaHistorialMatricula: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @POST
    @Path("cambiaEstadoMatr")
    @Produces("application/json")
    public Response cambiaEstadoMatr(String data) {
        System.out.println("a verrrr "+data);
        Response respuesta;
        Gson gson = new Gson();
        MatriculaDTO matriculaDTO = gson.fromJson(data, MatriculaDTO.class);
        try{
            matriculaHelper.cambiarEstadoByID(matriculaDTO.getId_matricula(), matriculaDTO.getFkid_estado_matricula());
            matriculaHelper.insertarObsEstadoMatricula(matriculaDTO.getId_matricula(), matriculaDTO.getDscrp_observacion(), matriculaDTO.getId_usuario());
            respuesta = Response.status(200).entity(matriculaDTO).build();
        }
        catch(Exception ex){
            System.out.println("cambiaEstadoMatr: " + ex);
            respuesta = Response.status(500).entity(matriculaDTO).build();
        }
        return respuesta;
    }
    
    @POST
    @Path("verObservacionMatricula")
    @Produces("application/json")
    public String verObservacionMatricula(String data) {
        Gson gson = new Gson();
        ListaMatriculaDTO listaMatriculaDTO = gson.fromJson(data, ListaMatriculaDTO.class);
        ListaMatriculaDTO respuesta = new ListaMatriculaDTO();
        try {
            respuesta = matriculaHelper.getObservacionMatricula(listaMatriculaDTO.getId_matricula());
        }catch(Exception e){
            System.out.println("verObservacionMatricula: "+e.getMessage());
        }
        return gson.toJson(respuesta);
    }
    
    @POST
    @Path("eliminarMatriculaAlumno")
    @Produces("application/json")
    public Response eliminarMatriculaAlumno(String data) {
        Response respuesta;
        Gson gson = new Gson();
        ListaMatriculaDTO listaMatriculaDTO = gson.fromJson(data, ListaMatriculaDTO.class);
        try{
            matriculaHelper.eliminarMatriculaByID(listaMatriculaDTO.getId_matricula());
            respuesta = Response.status(200).entity(listaMatriculaDTO).build();
        }
        catch(Exception ex){
            System.out.println("eliminarMatriculaAlumno: " + ex);
            respuesta = Response.status(500).entity(listaMatriculaDTO).build();
        }
        return respuesta;
    }
    
    @GET
    @Path("getListaAlumnosAntiguos")
    @Produces("application/json")
    public String getListaAlumnosAntiguos(String data) {
        Gson gson =new Gson();
        List lista = null;
        try{
            lista = matriculaHelper.getListMatriculaByAntiguo();
        }
        catch(Exception ex){
            System.out.println("getListaAlumnosAntiguos: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @GET
    @Path("getListaAlumnosRepetido")
    @Produces("application/json")
    public String getListaAlumnosRepetido(String data) {
        Gson gson =new Gson();
        List lista = null;
        try{
            lista = matriculaHelper.getListMatriculaByRepetido();
        }
        catch(Exception ex){
            System.out.println("getListaAlumnosRepetido: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @POST
    @Path("getDatosGeneradosMatr")
    @Produces("application/json")
    public String getDatosGeneradosMatr(String data) {
        Gson gson = new Gson();
        ListaMatriculaDTO listaMatriculaDTO = gson.fromJson(data, ListaMatriculaDTO.class);
        ListaMatriculaDTO respuesta = new ListaMatriculaDTO();
        try {
            respuesta = matriculaHelper.getDatosParaMatricular(listaMatriculaDTO.getId_per_alumno());
        }catch(Exception e){
            System.out.println("getDatosGeneradosMatr: "+e.getMessage());
        }
        return gson.toJson(respuesta);
    }
    
    @POST
    @Path("crearMatriculaDatos")
    @Produces("application/json")
    public Response crearMatriculaDatos(String data) {
        Response respuesta;
        Gson gson = new Gson();
        MatriculaDTO matriculaDTO = gson.fromJson(data, MatriculaDTO.class);
        try{
            matriculaHelper.registrarMatriculaByDato(
                    matriculaDTO.getCodigo_matricula(), 
                    matriculaDTO.getFec_realizada(), 
                    matriculaDTO.getId_per_alumno(), 
                    matriculaDTO.getId_estado_matricula(), 
                    matriculaDTO.getId_periodo_anual()
            );
            matriculaHelper.insertarObservacionHistorial(matriculaDTO.getFec_modificacion(), 
                                                         matriculaDTO.getDscrp_observacion(), 
                                                         matriculaDTO.getId_usuario()
            );
            respuesta = Response.status(200).entity(matriculaDTO).build();
        }
        catch(Exception ex){
            System.out.println("crearMatriculaDatos: " + ex);
            respuesta = Response.status(500).entity(matriculaDTO).build();
        }
        return respuesta;
    }
    
    /*---------------------------------------- INICIO DE MODIFICAR ALUMNO -----------------------------------------------------*/
    
    @GET
    @Path("listarAlumnosBusqueda")
    @Produces("application/json")
    public String listarAlumnosBusqueda(String data) {
        Gson gson =new Gson();
        List lista = null;
        try{
            lista = modificaAlumnoHelper.getListAlumnosBusqueda();
        }
        catch(Exception ex){
            System.out.println("listarAlumnosBusqueda: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @POST
    @Path("listarDatosDelAlumno")
    @Produces("application/json")
    public String listarDatosDelAlumno(String data) {
        Gson gson = new Gson();
        ListaAlumnoDTO listaAlumnoDTO = gson.fromJson(data, ListaAlumnoDTO.class);
        ListaAlumnoDTO respuesta = new ListaAlumnoDTO();
        try {
            respuesta = modificaAlumnoHelper.getListDatosByAlumno(listaAlumnoDTO.getCodigo_alumno());
        }catch(Exception e){
            System.out.println("listarDatosDelAlumno: "+e.getMessage());
        }
        return gson.toJson(respuesta);
    }
    
    @POST
    @Path("modificaDatosAlumno")
    @Produces("application/json")
    public Response modificaDatosAlumno(String data) {
        Response respuesta;
        Gson gson = new Gson();
        AlumnoDTO alumnoDTO = gson.fromJson(data, AlumnoDTO.class);
        try{
            modificaAlumnoHelper.updateAlumnoByDNI(alumnoDTO);
            respuesta = Response.status(200).entity(alumnoDTO).build();
        }
        catch(Exception ex){
            System.out.println("modificaDatosAlumno: " + ex);
            respuesta = Response.status(500).entity(alumnoDTO).build();
        }
        return respuesta;
    }
    
    @POST
    @Path("listarVinculosFamiliares")
    @Produces("application/json")
    public String listarVinculosFamiliares(String data) {
        Gson gson =new Gson();
        VinculoFamiliarDTO vinculoFamiliarDTO = gson.fromJson(data, VinculoFamiliarDTO.class);
        List lista = null;
        try{
            lista = modificaAlumnoHelper.getListFamiliaresByAlumno(vinculoFamiliarDTO.getCodigo_alumno());
        }
        catch(Exception ex){
            System.out.println("listarVinculosFamiliares: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @POST
    @Path("listarFamiliarApoderado")
    @Produces("application/json")
    public String listarFamiliarApoderado(String data) {
        Gson gson =new Gson();
        VinculoFamiliarDTO vinculoFamiliarDTO = gson.fromJson(data, VinculoFamiliarDTO.class);
        List lista = null;
        try{
            lista = modificaAlumnoHelper.getListFamiliarApoderadoByAlumno(vinculoFamiliarDTO.getCodigo_alumno());
        }
        catch(Exception ex){
            System.out.println("listarVinculosFamiliares: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @POST
    @Path("listarDatosFamiliar")
    @Produces("application/json")
    public String listarDatosFamiliar(String data) {
        Gson gson = new Gson();
        VinculoFamiliarDTO vinculoFamiliarDTO = gson.fromJson(data, VinculoFamiliarDTO.class);
        VinculoFamiliarDTO respuesta = new VinculoFamiliarDTO();
        try {
            respuesta = modificaAlumnoHelper.getListDatosFamiliarById(vinculoFamiliarDTO.getId_per_familiar());
            System.out.println(""+respuesta.toString());
        }catch(Exception e){
            System.out.println("listarDatosFamiliar: "+e.getMessage());
        }
        return gson.toJson(respuesta);
    }
    
    @POST
    @Path("asignaApoderadoAlAlumno")
    @Produces("application/json")
    public Response asignaApoderadoAlAlumno(String data) {
        System.out.println("-->" +data);
        Response respuesta;
        Gson gson = new Gson();
        VinculoFamiliarDTO vinculoFamiliarDTO = gson.fromJson(data, VinculoFamiliarDTO.class);
        try{
            modificaAlumnoHelper.updateApoderadoByIdFamiliar(vinculoFamiliarDTO.getCodigo_alumno(), vinculoFamiliarDTO.getId_per_familiar());
            respuesta = Response.status(200).entity(vinculoFamiliarDTO).build();
        }
        catch(Exception ex){
            System.out.println("asignaApoderadoAlAlumno: " + ex);
            respuesta = Response.status(500).entity(vinculoFamiliarDTO).build();
        }
        return respuesta;
    }
    
}
