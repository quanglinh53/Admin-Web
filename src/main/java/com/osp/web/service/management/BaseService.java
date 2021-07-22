package com.osp.web.service.management;

import com.osp.model.admin.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class BaseService {

  protected User getCurrentUser(){
    return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
  }
}
