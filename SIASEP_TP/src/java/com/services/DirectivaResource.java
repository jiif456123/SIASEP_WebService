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
    @Path("listaAlumnosNuevos")
    @Produces("application/json")
    public String getListaAlumnosNuevos(String data) {
        Gson gson =new Gson();
        List lista = null;
        try{
            lista = matriculaHelper.getListMatriculaByNuevo();
        }
        catch(Exception ex){
            System.out.println("getListaAlumnosNuevos: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @GET
    @Path("listaAlumnosAntiguos")
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
    @Path("listaAlumnosIntercambio")
    @Produces("application/json")
    public String getListaAlumnosIntercambio(String data) {
        Gson gson =new Gson();
        List lista = null;
        try{
            lista = matriculaHelper.getListMatriculaByIntercambio();
        }
        catch(Exception ex){
            System.out.println("getListaAlumnosIntercambio: "+ex);
        }
        return gson.toJson(lista);
    }
    
    @GET
    @Path("listaAlumnosRepetido")
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
