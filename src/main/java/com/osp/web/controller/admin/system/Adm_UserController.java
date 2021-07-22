package com.osp.web.controller.admin.system;

import com.osp.common.ConstantAuthor;
import com.osp.common.PagingResult;
import com.osp.common.Utils;
import com.osp.model.admin.Group;
import com.osp.model.admin.GroupUser;
import com.osp.model.admin.User;
import com.osp.validator.user.UserAddValidator;
import com.osp.validator.user.UserUpdateValidator;
import com.osp.web.service.group.GroupService;
import com.osp.web.service.user.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by Admin on 12/26/2017.
 */
@Controller
@RequestMapping("/admin/system/user")
public class Adm_UserController {
    private Logger logger= LogManager.getLogger(Adm_UserController.class);
    @Autowired
    UserService userService;
    @Autowired
    GroupService groupService;
    @Autowired
    UserUpdateValidator userUpdateValidator;

    @Autowired
    UserAddValidator userAddValidator;

    @GetMapping("/list")
    @Secured(ConstantAuthor.User.view)
    public String UserList(Model model,@RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber,
                              @RequestParam(value = "filterUsername", required = false, defaultValue = "") String filterUsername) {
        PagingResult page=new PagingResult();
        page.setPageNumber(pageNumber);
        page= userService.pageUser(Utils.trim(filterUsername),page).orElse(new PagingResult());
        model.addAttribute("page",page);
        model.addAttribute("filterUsername",filterUsername);
        return "adm_user.list";
    }

    @GetMapping("/add")
    @Secured(ConstantAuthor.User.add)
    public String UserAddView() {
        return "adm_user.add";
    }

    @PostMapping("/add")
    @Secured(ConstantAuthor.User.add)
    public String UserAdd(Model model, @Valid User user, BindingResult result, String confirmPassword, RedirectAttributes attributes, HttpServletRequest request) {
        userAddValidator.validate(user,result);
        if(result.hasErrors()){
            model.addAttribute("user",user);
            return "adm_user.add";
        }
        if(!confirmPassword.equals(user.getPassword())){
            model.addAttribute("messagePassword","Xác nhận mật khẩu không đúng");
            model.addAttribute("user",user);
            return "adm_user.add";
        }
        try{
            String ipClient= Utils.getIpClient(request);
            boolean checkAdd=userService.addUser(user,ipClient).orElse(false);
            if(!checkAdd){
                model.addAttribute("messageError","Có lỗi xảy ra. Hãy thử lại sau!");
                return "adm_user.add";
            }
        }catch (Exception e){
            logger.error("Have a error UserController.UserAdd:"+e.getMessage());
            model.addAttribute("messageError","Có lỗi xảy ra. Hãy thử lại sau!");
            return "adm_user.add";
        }

        attributes.addFlashAttribute("success", "Thêm người dùng thành công!");

        return "redirect:/admin/system/user/list";
    }

    @GetMapping("/edit/{id}")
    @Secured(ConstantAuthor.User.edit)
    public String UserEditView(Model model,@PathVariable("id")  Long id) {
        if(id==null || id==0) return "404";
        User user=userService.get(id).orElse(new User());
        model.addAttribute("item",user);
        return "adm_user.edit";
    }

    @PostMapping("/edit")
    @Secured(ConstantAuthor.User.edit)
    public String UserEdit(Model model, @Valid User item, BindingResult result, String newPassword, String confirmPassword, RedirectAttributes attributes, HttpServletRequest request) {
        userUpdateValidator.validate(item,result);
        if(result.hasErrors()){
            model.addAttribute("item",item);
            return "adm_user.edit";
        }


        if(!StringUtils.isBlank(newPassword)){
            if(!confirmPassword.equals(newPassword)){
                model.addAttribute("messagePassword","Xác nhận mật khẩu không đúng");
                model.addAttribute("item",item);
                return "adm_user.edit";
            }
            if(newPassword.length()<6 || newPassword.length()>15){
                model.addAttribute("messageNewPassword", "Mật khẩu không được để trống, dài tối thiều 6 ký tự, tối đa 15 ký tự");
                model.addAttribute("item",item);
                return "adm_user.edit";
            }
            item.setPassword(newPassword);
        }

        boolean check=false;
        try{
            String ipClient= Utils.getIpClient(request);
            check=userService.editUserFromView(item,ipClient).orElse(false);
        }catch (Exception e){
            logger.error("Have an error UserController.UserEdit:"+e.getMessage());

        }

        if(!check){
            model.addAttribute("messageError","Có lỗi xảy ra. Hãy thử lại sau!");
            model.addAttribute("item",item);
            return "adm_user.edit";
        }

        attributes.addFlashAttribute("success", "Sửa người dùng thành công!");

        return "redirect:/admin/system/user/list";
    }

//    @PostMapping("/delete")
//    public String UserDelete(Long id, RedirectAttributes attributes,HttpServletRequest request) {
//        boolean check=false;
//        try{
//            String ipClient= Utils.getIpClient(request);
//            check=userService.deleteUser(id,ipClient).orElse(false);
//        }catch (Exception e){
//            logger.error("have an error UserDelete:"+e.getMessage());
//        }
//        if(!check){
//            attributes.addFlashAttribute("messageError","Có lỗi xảy ra. Hãy thử lại sau!");
//            return "redirect:/system/user/list";
//        }
//        attributes.addFlashAttribute("success", "Xóa người dùng thành công!");
//
//        return "redirect:/system/user/list";
//    }

    @GetMapping("/user-group/{id}")
    @Secured(ConstantAuthor.User.author)
    public String userGroup(Model model,@PathVariable("id") Long id){
        if(id==null) return "404";
        User user=userService.get(id).orElse(null);
        if(user==null) return "404";
        //load all groups
        List<Group> allGroups=groupService.loadAllGroup().orElse(new ArrayList<>());
        //load group of user
        List<Group> listGroups=groupService.loadAllGroupOfUser(id).orElse(new ArrayList<>());
        String groups="";
        if(listGroups.size()>0){
            for(Group item:listGroups){
                groups+=item.getId()+",";
            }
        }
        model.addAttribute("user",user);
        model.addAttribute("groups",groups);
        model.addAttribute("allGroups",allGroups);
        return "adm_user.group";
    }

    @PostMapping("user-group")
    @Secured(ConstantAuthor.User.author)
    public String addUserGroup(Model model, Long id,String listGroup,RedirectAttributes attributes){
        if(id==null) return "404";
        User user = userService.get(id).orElse(null);
        if (user == null) return "404";
        listGroup= Utils.trim(listGroup);
        try {
            if (listGroup.length() > 0) {
                String[] array = listGroup.split(",");
                List<String> stringList = Arrays.stream(array).collect(Collectors.toList());
                if (stringList.size() > 0) {
                    List<GroupUser> items = new ArrayList<>();
                    User userCurrent = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                    for (String item : stringList) {
                        items.add(new GroupUser(Integer.valueOf(item), id, userCurrent.getUsername(), new Date()));
                    }
                    if (items.size() > 0) {
                        groupService.addListGroupUser(items,id);
                    }
                }
            } else {
                groupService.deleteListGroupOfUser(id);
            }
            attributes.addFlashAttribute("success","Phân quyền thành công!");
            return "redirect:/admin/system/user/list";
        }catch (Exception e){
            logger.error("Have an error UserController.addUserGroup:"+e.getMessage());
            model.addAttribute("errorMessage","Có lỗi xảy ra, hãy thử lại sau!");
            //load all groups
            List<Group> allGroups=groupService.loadAllGroup().orElse(new ArrayList<>());
            model.addAttribute("user",user);
            model.addAttribute("groups",listGroup);
            model.addAttribute("allGroups",allGroups);
        }
        model.addAttribute("errorMessage","Có lỗi xảy ra, hãy thử lại sau!");
        return "adm_user.group";
    }

    @GetMapping("/change-my-pass")
    public String changeMyPassView(){
        return "adm_user.change.pass";
    }
    @PutMapping("change-my-pass")
    public ResponseEntity<Integer> changeMyPass(@RequestParam String passwordCurrent, @RequestParam String passwordNew){
        //0-dieu kien ko phu hop, 1-oke thanh cong,2-mat khau cu khong dung,3-co loi server khi change
        passwordCurrent= Utils.trim(passwordCurrent);
        passwordNew= Utils.trim(passwordNew);
        if(StringUtils.isBlank(passwordCurrent)||StringUtils.isBlank(passwordNew)){
            return new  ResponseEntity<Integer>(0, HttpStatus.OK);
        }
        Integer result=0;
        try{
            result=userService.changeMyPass(passwordCurrent,passwordNew).orElse(3);

        }catch (Exception e){
            logger.error("Have an error changMyPass:"+e.getMessage());
            return new  ResponseEntity<Integer>(3, HttpStatus.OK);
        }
        return new ResponseEntity<Integer>(result, HttpStatus.OK);
    }
}
