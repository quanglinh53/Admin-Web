package com.osp.web.controller.admin.management;

import com.osp.common.PagingResult;
import com.osp.dto.AccountDTO;
import com.osp.dto.PayCardDTO;
import com.osp.dto.TransactionFormDTO;
import com.osp.web.service.management.AccountService;
import com.osp.web.service.management.PayCardService;
import com.osp.web.service.management.TransactionFormService;
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
@RequestMapping("/admin/management/transaction-form")
public class TransactionFormController {

  private Logger logger = LogManager.getLogger(TransactionFormController.class);

  @Autowired
  AccountService accountService;

  @Autowired
  PayCardService payCardService;

  @Autowired
  TransactionFormService transactionFormService;


  @PostMapping
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity transactionFormAdd(@RequestBody TransactionFormDTO dto,
      HttpServletRequest request) {
    try {
      return transactionFormService.add(dto);
    } catch (Exception e) {
      logger.error("Have a error method transactionFormAdd():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @PutMapping("/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity transactionFormEdit(
      @PathVariable("id") String id,
      @RequestBody TransactionFormDTO dto, HttpServletRequest request) {
    try {
      return transactionFormService.edit(id, dto);
    } catch (Exception e) {
      logger.error("Have a error method transactionFormEdit():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @DeleteMapping("/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity transactionFormDelete(@PathVariable("id") String id,
      HttpServletRequest request) {
    try {
      return transactionFormService.delete(id);
    } catch (Exception e) {
      logger.error("Have a error method transactionFormDelete():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @GetMapping
//  @Secured(ConstantAuthor.Category.view)
  public ResponseEntity<PagingResult> transactionFormSearch(
      @RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber,
      @RequestParam(value = "size", required = false, defaultValue = "10") int size,
       TransactionFormDTO dto) {
    PagingResult page = new PagingResult();
    page.setPageNumber(pageNumber);
    page.setNumberPerPage(size);
    try {
      return  transactionFormService.page(dto, page);
    } catch (Exception e) {
      logger.error("Have an error on method categoryListSearch:" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @GetMapping("/list")
//  @Secured(ConstantAuthor.Category.view)
  public String transactionFormList(Model model) {
    return "adm.transaction.form.list";
  }

}
