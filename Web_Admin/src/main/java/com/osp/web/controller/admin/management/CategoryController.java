package com.osp.web.controller.admin.management;

import com.osp.common.PagingResult;
import com.osp.dto.CategoryDTO;
import com.osp.web.service.management.AccountService;
import com.osp.web.service.management.PayCardService;
import com.osp.web.service.management.CategoryService;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Admin on 2/26/2018.
 */
@Controller
@RequestMapping("/admin/management/category")
public class CategoryController {

  private Logger logger = LogManager.getLogger(CategoryController.class);


  @Autowired
  CategoryService categoryService;


  @PostMapping
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity CategoryAdd(@RequestBody CategoryDTO dto,
      HttpServletRequest request) {
    try {
      return categoryService.add(dto);
    } catch (Exception e) {
      logger.error("Have a error method CategoryAdd():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @PutMapping("/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity CategoryEdit(
      @PathVariable("id") int id,
      @RequestBody CategoryDTO dto, HttpServletRequest request) {
    try {
      return categoryService.edit(id, dto);
    } catch (Exception e) {
      logger.error("Have a error method CategoryEdit():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @DeleteMapping("/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity CategoryDelete(@PathVariable("id") int id,
      HttpServletRequest request) {
    try {
      return categoryService.delete(id);
    } catch (Exception e) {
      logger.error("Have a error method CategoryDelete():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @GetMapping
//  @Secured(ConstantAuthor.Category.view)
  public ResponseEntity<PagingResult> CategorySearch(
      @RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber,
      @RequestParam(value = "size", required = false, defaultValue = "10") int size,
       CategoryDTO dto) {
    PagingResult page = new PagingResult();
    page.setPageNumber(pageNumber);
    page.setNumberPerPage(size);
    try {
      return  categoryService.page(dto, page);
    } catch (Exception e) {
      logger.error("Have an error on method categoryListSearch:" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @GetMapping("/list")
//  @Secured(ConstantAuthor.Category.view)
  public String CategoryList(Model model) {
    return "adm.category.list";
  }


}
