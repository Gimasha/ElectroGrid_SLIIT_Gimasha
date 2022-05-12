package com.electrogrid.controllers;

import com.electrogrid.services.LoginService;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/login")
public class LoginController {

    LoginService loginService = new LoginService();

    @Path("/employee")
    @POST()
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public Response EmployeeLogin(@FormParam("telN0") String telNo, @FormParam("password") String password) {
        return loginService.loginEmployee(telNo,password);
    }

    @Path("/customer")
    @POST()
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public Response CustomerLogin(@FormParam("accountID") String accountID, @FormParam("password") String password) {
        return loginService.loginCustomer(accountID, password);
    }
}
