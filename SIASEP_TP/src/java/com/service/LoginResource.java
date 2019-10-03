package com.service;

import com.google.gson.Gson;
import com.DTO.LoginDTO;
import com.helper.LoginHelper;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;

@Path("login")
public class LoginResource {

    LoginHelper loginHelper;
    
    @Context
    private UriInfo context;

    public LoginResource() {
        loginHelper = new LoginHelper();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson() {
        //TODO return proper representation object
        throw new UnsupportedOperationException();
    }

    /**
     * PUT method for updating or creating an instance of LoginResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
    
    @POST
    @Path("loginUsuario")
    @Produces("application/json")
    public String loginUsuario(String data) {
        System.out.println("--->" +data);
        Gson gson = new Gson();
        LoginDTO loginDTO = gson.fromJson(data, LoginDTO.class);
        LoginDTO respuesta = new LoginDTO();
        try {
            respuesta = loginHelper.iniciarSession(loginDTO);
            System.out.println(".-.-.-> "+respuesta);
        }catch(Exception e){
            System.out.println("loginUsuario controlado aqui.."+e.getMessage());
        }
        return gson.toJson(respuesta);
    }
    
}
