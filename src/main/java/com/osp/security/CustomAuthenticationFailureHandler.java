package com.osp.security;

/**
 * Created by Admin on 4/3/2018.
 */
import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler{

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        if(exception.getClass().isAssignableFrom(BadCredentialsException.class)) {
            setDefaultFailureUrl("/admin/login?error=true");
        }
       /* else if (exception.getClass().isAssignableFrom(DisabledException.class)) {
            setDefaultFailureUrl("/admin/login?error=disable");
        }*/
        else if (exception.getClass().isAssignableFrom(SessionAuthenticationException.class)) {
            setDefaultFailureUrl("/admin/login?error=true");
        }
        else if(exception.getMessage().equals("blocked")){
            setDefaultFailureUrl("/admin/login?error=disable");
        }
        else{
            setDefaultFailureUrl("/admin/login?error=true");
        }

        super.onAuthenticationFailure(request, response, exception);

    }

}
