package com.services;

import com.DTO.ListaMatriculaDTO;
import com.google.gson.Gson;
import com.helper.MatriculaHelper;
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

@Path("directiva")
public class DirectivaResource {

    MatriculaHelper matriculaHelper;
    
    @Context
    private UriInfo context;

    public DirectivaResource() {
        matriculaHelper = new MatriculaHelper();
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
    
    @GET
    @Path("listaPeriodoSelect")
    @Produces("application/json")
    public String getListaPeriodoSelect(String data) {
        Gson gson =new Gson();
        List lista = null;
        try{
            lista = matriculaHelper.getListPeriodo();
        }
        catch(Exception ex){
            System.out.println("getListaPeriodoSelect: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @POST
    @Path("refrescaListaMatHabilitado")
    @Produces("application/json")
    public String refrescaListaMatHabilitado(String data) {
        Gson gson =new Gson();
        List lista = null;
        ListaMatriculaDTO listaMatriculaDTO = gson.fromJson(data, ListaMatriculaDTO.class);
        try{
            lista = matriculaHelper.getListMatriculaByHabilitado(listaMatriculaDTO.getFkid_periodo_anual());
        }
        catch(Exception ex){
            System.out.println("refrescaListaMatHabilitado: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @POST
    @Path("refrescaListaMatDeshabilitado")
    @Produces("application/json")
    public String refrescaListaMatDeshabilitado(String data) {
        Gson gson =new Gson();
        List lista = null;
        ListaMatriculaDTO listaMatriculaDTO = gson.fromJson(data, ListaMatriculaDTO.class);
        try{
            lista = matriculaHelper.getListMatriculaByDeshabilitado(listaMatriculaDTO.getFkid_periodo_anual());
        }
        catch(Exception ex){
            System.out.println("refrescaListaMatDeshabilitado: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @GET
    @Path("getListaHistorialMatricula")
    @Produces("application/json")
    public String getListaHistorialMatricula(String data) {
        Gson gson =new Gson();
        List lista = null;
        try{
            lista = matriculaHelper.getListHistorialMatricula();
        }
        catch(Exception ex){
            System.out.println("getListaHistorialMatricula: "+ex);
        }
        return gson.toJson(lista);
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
    
    
}
