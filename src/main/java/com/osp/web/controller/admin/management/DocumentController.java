package com.osp.web.controller.admin.management;

import com.osp.common.PagingResult;
import com.osp.dto.DocumentDTO;
import com.osp.dto.JobDTO;
import com.osp.web.service.management.AccountService;
import com.osp.web.service.management.PayCardService;
import com.osp.web.service.management.DocumentService;
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
@RequestMapping("/admin/management/document")
public class DocumentController {

  private Logger logger = LogManager.getLogger(DocumentController.class);

  @Autowired
  AccountService accountService;

  @Autowired
  PayCardService payCardService;

  @Autowired
  DocumentService documentService;


  @PostMapping
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity documentAdd(@RequestBody DocumentDTO dto,
      HttpServletRequest request) {
    try {
      return documentService.add(dto);
    } catch (Exception e) {
      logger.error("Have a error method documentAdd():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @PutMapping("/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity documentEdit(
      @PathVariable("id") String id,
      @RequestBody DocumentDTO dto, HttpServletRequest request) {
    try {
      return documentService.edit(id, dto);
    } catch (Exception e) {
      logger.error("Have a error method documentEdit():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @DeleteMapping("/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity documentDelete(@PathVariable("id") String id,
      HttpServletRequest request) {
    try {
      return documentService.delete(id);
    } catch (Exception e) {
      logger.error("Have a error method documentDelete():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @GetMapping
//  @Secured(ConstantAuthor.Category.view)
  public ResponseEntity<PagingResult> documentSearch(
      @RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber,
      @RequestParam(value = "size", required = false, defaultValue = "10") int size,
       DocumentDTO dto) {
    PagingResult page = new PagingResult();
    page.setPageNumber(pageNumber);
    page.setNumberPerPage(size);
    try {
      return  documentService.page(dto, page);
    } catch (Exception e) {
      logger.error("Have an error on method categoryListSearch:" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @GetMapping("/list")
//  @Secured(ConstantAuthor.Category.view)
  public String documentList(Model model) {
    return "adm.document.list";
  }

  @PostMapping("/change-status/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity chaneStatus(@RequestBody DocumentDTO dto, @PathVariable String id,
      HttpServletRequest request) {
    try {
      return documentService.changeStatus(id, dto.getStatus());
    } catch (Exception e) {
      logger.error("Have a error method jobAdd():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }
}
