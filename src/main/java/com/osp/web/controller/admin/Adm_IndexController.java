package com.osp.web.controller.admin;

import com.osp.common.PagingResult;
import com.osp.model.admin.User;
import com.osp.web.service.logaccess.LogAccessService;
import com.osp.web.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Admin on 12/14/2017.
 */
@Controller
@RequestMapping("/admin")
public class Adm_IndexController {

    @Autowired
    LogAccessService logAccessService;

    @Autowired
    UserService userService;

/*    @GetMapping("/login")
    public String login(){
        return "adm_login";
    }*/

    @GetMapping("/login")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            if (error.equals("true")) {
                model.addObject("error", "1");
            } else if (error.equals("disable")) {
                model.addObject("error", "0");
            }

        }
        if (logout != null) {
            model.addObject("msg", "logoutSucess");
        }
        model.setViewName("adm_login");
        return model;
    }

    @GetMapping("/")
    public String index(Model model, HttpServletRequest  request) {
        return "adm_index";
    }


    /*For my history*/
    @GetMapping("/history")
    public String getOfUser(){
        return "adm_my.history";
    }

    @GetMapping("/history/my-log")
    public ResponseEntity<PagingResult> logOfUser(@RequestParam(value = "p", required = false, defaultValue = "1")int pageNumber){
        PagingResult page=new PagingResult();
        page.setPageNumber(pageNumber);
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        try{
            page=logAccessService.getByUserId(page,user.getId()).orElse(new PagingResult());
        }catch (Exception e){
        }
        return new ResponseEntity<PagingResult>(page, HttpStatus.OK);
    }

    //ham lay du lieu kiem tra leftmenu dang dong hay mo
    @GetMapping("/change-nav")
    public ResponseEntity<Boolean> changeNavXs(HttpServletRequest request){
        if(request.getSession().getAttribute("nav-xs")!=null){
            Boolean navXs=(Boolean)request.getSession().getAttribute("nav-xs");
            if(navXs!=null){
                request.getSession().setAttribute("nav-xs",!navXs);
            }
        }else{
            request.getSession().setAttribute("nav-xs",true);
        }
        return new ResponseEntity<Boolean>(true,HttpStatus.OK);
    }
//    //ham thay thoi thoi gian mau sac
//    @GetMapping("/sun-moon")
//    public ResponseEntity<Boolean> changeTime(HttpServletRequest request){
//        boolean sun= SunMoonMenu.sun;
//        request.getSession().setAttribute("sun-moon",sun);
//        return new ResponseEntity<Boolean>(sun,HttpStatus.OK);
//    }

    @GetMapping("/dashboard")
    public String dashboard(Model model){
        return "adm_dashboard";
    }
    /*CAC HAM PHUC VU DASHBOARD BIEU DO*/

    @GetMapping("/revenue-report")
    public String revenueRepor(){
        return "adm.revenue.report";
    }


}
