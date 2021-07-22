package com.osp.web.controller.admin.content;

import com.osp.common.*;
import com.osp.model.Article;
import com.osp.model.Category2;
import com.osp.model.admin.User;
import com.osp.validator.content.ArticleAddValidator;
import com.osp.validator.content.CategoryAddValidator;
import com.osp.validator.content.CategoryEditValidator;
import com.osp.web.dao.content.Category2Dao;
//import com.osp.web.dao.content.groupTopic.GroupTopicDao;


import com.osp.web.dao.content.ArticleDao;
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
import java.io.*;
import java.util.*;

/**
 * Created by Admin on 2/26/2018.
 */
@Controller
@RequestMapping("/admin/content")
public class Adm_ContentController {
    private Logger logger= LogManager.getLogger(Adm_ContentController.class);

//    @Autowired
//    ArticleDao articleService;
    @Autowired
Category2Dao categoryDao;
    @Autowired
    ArticleDao articleDAO;
    @Autowired
    ArticleAddValidator articleAddValidator;
    @Autowired
    CategoryAddValidator categoryAddValidator;
    @Autowired
    CategoryEditValidator categoryEditValidator;

   @GetMapping("/category/list")
   @Secured(ConstantAuthor.Category.view)
   public String categoryList(Model model){
       return "adm_content.category.list";
   }

    @GetMapping("/category/list/search")
    @Secured(ConstantAuthor.Category.view)
    public ResponseEntity<PagingResult> categoryListSearch(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber, String name){
        PagingResult page=new PagingResult();
        page.setPageNumber(pageNumber);
        try{
            page=categoryDao.page(page,name);
        }catch (Exception e){
            logger.error("Have an error on method categoryListSearch:"+e.getMessage());
        }
        return new ResponseEntity<PagingResult>(page, HttpStatus.OK);
    }

    @GetMapping("/category/list/all")
    public ResponseEntity<List<Category2>> categoryList(){
        List<Category2> list=categoryDao.ltsByOn();
        return new ResponseEntity<List<Category2>>(list, HttpStatus.OK);
    }


    @GetMapping("/category/add")
    @Secured(ConstantAuthor.Category.add)
    public String categoryAdd(Model model){
       List<Category2> ltsCategory = categoryDao.listByRoot();
       model.addAttribute("groupTopics",ltsCategory);
       return "adm_content.category.add";
    }

    @PostMapping("/category/add")
    @Secured(ConstantAuthor.Category.add)
    public String categoryAdd(Model model, @Valid Category2 item, BindingResult result, RedirectAttributes attributes, HttpServletRequest request){
        categoryAddValidator.validate(item,result);
        List<Category2> groupTopics = categoryDao.listByRoot();
        model.addAttribute("groupTopics",groupTopics);
        if(result.hasErrors()){
            model.addAttribute("item",item);
            return "adm_content.category.add";
        }
        boolean check=false;
        try{
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            item.setDateCreated(new Date());
            item.setUserCreated(user.getId());
            item.setDateUpdated(new Date());
            item.setUserUpdated(user.getId());
            String url=item.getName().replaceAll("\\s+","-")+new Date().getTime();
            item.setUrl(url);
            item.setStatus(Constant.STATUS_CATEGORY_ON);
            item.setParentId(item.getParentId()==null?0:item.getParentId());
            check=categoryDao.add(item);
        }catch (Exception e){
            logger.error("Have a error method categoryAdd():"+e.getMessage());
        }
        if(!check){
            model.addAttribute("item",item);
            model.addAttribute("messageError","Có lỗi xảy ra. Hãy thử lại sau!");
            return "adm_content.category.add";
        }
        attributes.addFlashAttribute("success", "Thêm mới thành công!");
        return "redirect:/admin/content/category/list";
    }

    @GetMapping("/category/edit/{id}")
    @Secured(ConstantAuthor.Category.edit)
    public String categoryEdit(Model model, @PathVariable("id") Integer id){
        Category2 item=categoryDao.get(id);
        List<Category2> groupTopics = categoryDao.listByRoot();
        model.addAttribute("groupTopics",groupTopics);
        if(item==null) return "404";
        model.addAttribute("item",item);
        return "adm_content.category.edit";
    }

    @PostMapping("/category/edit")
    @Secured(ConstantAuthor.Category.edit)
    public String categoryEdit(Model model, @Valid Category2 item, BindingResult result, RedirectAttributes attributes, HttpServletRequest request){
        categoryEditValidator.validate(item,result);
        List<Category2> groupTopics = categoryDao.listByRoot();
        model.addAttribute("groupTopics",groupTopics);
        if(result.hasErrors()){
            model.addAttribute("item",item);
            return "adm_content.category.edit";
        }
        boolean check=false;
        try{
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            Category2 itemDB=categoryDao.get(item.getId());
            if(itemDB==null){
                model.addAttribute("item",item);
                model.addAttribute("messageError","Chủ đề không tồn tại!");
                return "adm_content.category.edit";
            }

            itemDB.setParentId(item.getParentId());
            itemDB.setName(item.getName());
            itemDB.setDescription(item.getDescription());
            itemDB.setStatus(item.getStatus());
            itemDB.setDateUpdated(new Date());
            itemDB.setUserUpdated(user.getId());
            check=categoryDao.edit(itemDB);
        }catch (Exception e){
            logger.error("Have a error method categoryEdit():"+e.getMessage());
        }
        if(!check){
            model.addAttribute("item",item);
            model.addAttribute("messageError","Có lỗi xảy ra. Hãy thử lại sau!");
            return "adm_content.category.edit";
        }
        attributes.addFlashAttribute("success", "Sửa thành công!");
        return "redirect:/admin/content/category/list";
    }

    @PostMapping("/category/delete")
    @Secured(ConstantAuthor.Category.delete)
    public String categoryDelete(RedirectAttributes attributes, Integer id, HttpServletRequest request){
        if(id==null) return "404";
        boolean check=false;
        try{
            check=categoryDao.delete(id);
        }catch (Exception e){
            logger.error("Have a error method categoryDelete():"+e.getMessage());
        }
        if(!check){
            attributes.addFlashAttribute("messageError","Có lỗi xảy ra, có thể đang tồn tại bài viết thuộc chủ đề này, vui lòng kiểm tra lại!");
            return"redirect:/admin/content/category/list";
        }
        attributes.addFlashAttribute("success","Xóa chuyên mục thành công!");
        return "redirect:/admin/content/category/list";
    }

    /*@GetMapping("/category/delete")
    public ResponseEntity<Boolean> categoryDelete(@RequestParam(value = "id", required = false) Integer id, HttpServletRequest request) {
        Category itemBeforeDelete = categoryDao.get(id);
        categoryDao.delete(id);
        return new ResponseEntity<Boolean>(true, HttpStatus.OK);
    }*/

    /*END CHỦ ĐỀ*/


    @GetMapping("/article/list")
    @Secured(ConstantAuthor.Article.view)
    public String articleList(){
        return "adm_content.article.list";
    }



    @GetMapping("/article/list/search")
    @Secured(ConstantAuthor.Article.view)
    public ResponseEntity<PagingResult> articleListSearch(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber, @RequestParam(value = "name", required = false) String name,@RequestParam(value = "status",required = false)Integer status){
        PagingResult page=new PagingResult();
        page.setPageNumber(pageNumber);
        try{
            page=articleDAO.page(page,name,status).orElse(new PagingResult());
        }catch (Exception e){
            logger.error("Have an error on method articleListSearch:"+e.getMessage());
        }
        return new ResponseEntity<PagingResult>(page, HttpStatus.OK);
    }


    public static void copyFile(File source, File destination) throws IOException {

        // Using try with resources (No need to close files).
        try (InputStream inputStream = new FileInputStream(source); OutputStream outputStream = new FileOutputStream(destination);) {

            // Max length per line = 1024.
            byte[] buffer = new byte[1024];

            int lineLength;
            while ((lineLength = inputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, lineLength);
            }
        }

    }



    @PostMapping("/article/add")
    @Secured(ConstantAuthor.Article.add)
    public ResponseEntity<String> articleAdd(Model model, @RequestBody Article item, BindingResult result, RedirectAttributes attributes, HttpServletRequest request){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();


          if(item.getId()==null){
          item.setUserCreated(user.getUsername());
          item.setDateCreated(new Date());
          item.setStatus(Constant.Status.MOI_TAO);
          item.setView(0);
          String url=item.getTitle().replaceAll("\\s+","-")+new Date().getTime();
          item.setUrl(url);
          articleDAO.add(item);
          }else {
              if(item.getStatus()==2){
              item.setDateUpdated(new Date());
              item.setUserCreated(user.getUsername());}
              articleDAO.edit(item);
          }
        return new ResponseEntity<String>("1", HttpStatus.OK);
    }



//    @GetMapping("/article/detail/{id}")
//    @Secured(ConstantAuthor.Article.edit)
//    public String articleDetail(Model model, @PathVariable("id") Integer id){
//        Article item=articleDAO.get(id);
//        List<Category> list=categoryDao.list();
//        if((list!=null && list.size()>0) && item!=null){
//            model.addAttribute("categories",list);
//            model.addAttribute("item",item);
//
//        }else{
//            return "404";
//        }
//        return "adm_content.article.detail";
//    }
//
//
//    @GetMapping("/article/edit/{id}")
//    @Secured(ConstantAuthor.Article.edit)
//    public String articleEdit(Model model, @PathVariable("id") Integer id){
//        Article item=articleService.get(id);
//         model.addAttribute("item",item);
//        List<GroupTopic> groupTopics = groupTopicDao.list(null);
//        model.addAttribute("groupTopics",groupTopics);
//        List<Category> categories = categoryDao.list();
//        model.addAttribute("categories",categories);
//        return "adm_content.article.edit";
//    }

//    @PostMapping("/article/edit")
//    @Secured(ConstantAuthor.Article.edit)
//    public String articleEdit(Model model, @Valid Article item, BindingResult result, RedirectAttributes attributes, HttpServletRequest request){
//        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        articleAddValidator.validate(item,result);
//
//        if(!result.hasErrors()){
//            Article article=articleService.get(item.getId());
//            article.setTitle(item.getTitle());
//            article.setShortContent(item.getShortContent());
//            article.setContent(item.getContent());
//            article.setCategory(item.getCategory());
//            article.setIsPin(item.getIsPin());
//            article.setStatus(item.getStatus());
//            article.setUserUpdated(user.getId());
//            article.setUsernameUpdated(user.getUsername());
//            article.setUserFullNameUpdated(user.getFullName());
//            article.setDateUpdated(new Date());
//          articleService.edit(article);
//            attributes.addFlashAttribute("success", "Cập nhật thành công!");
//        }
//        else{
//            List<GroupTopic> groupTopics = groupTopicDao.list(null);
//            model.addAttribute("groupTopics",groupTopics);
//            List<Category> categories = categoryDao.list();
//            model.addAttribute("categories",categories);
//            model.addAttribute("item",item);
//            return "adm_content.article.edit";
//        }
//
//       return "redirect:/admin/content/article/list";
//
//
//}
//
    @GetMapping("/article/delete")
    public ResponseEntity<Boolean> searchToChucVaDGV(@RequestParam(value = "id", required = false) Integer id, HttpServletRequest request) {
        Article itemBeforeDelete = articleDAO.get(id);
        articleDAO.del(id);
        return new ResponseEntity<Boolean>(true, HttpStatus.OK);
    }
//
//
//    public Article setDefaultValueArticle(Article item){
//        item.setByCustomer(0);//dc tạo bởi admin
//        item.setIdLike("");
//        item.setIdDislike("");
//        item.setStatus(Constant.TRANG_THAI_BAI_VIET.CONG_KHAI);
//        item.setIsPin(0);
//        item.setCountLike(0l);
//        item.setCountDisLike(0l);
//        item.setCountView(0l);
//        return item;
//    }



}
