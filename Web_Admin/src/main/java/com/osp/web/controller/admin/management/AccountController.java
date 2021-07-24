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
@RequestMapping("/admin/management/account")
public class AccountController {

  private Logger logger = LogManager.getLogger(AccountController.class);

  @Autowired
  AccountService accountService;

  @Autowired
  PayCardService payCardService;

  @Autowired
  TransactionFormService transactionFormService;

  @GetMapping("/list")
//  @Secured(ConstantAuthor.Category.view)
  public String categoryList(Model model) {
    return "adm.account.list";
  }

  @PostMapping
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity addAcount(@RequestBody AccountDTO dto, HttpServletRequest request) {
    try {
      return accountService.add(dto);
    } catch (Exception e) {
      logger.error("Have a error method addAcount():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @GetMapping
//  @Secured(ConstantAuthor.Category.view)
  public ResponseEntity<PagingResult> accountListSearch(
      @RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber,
      @RequestParam(value = "size", required = false, defaultValue = "10") int size,
      AccountDTO dto) {
    PagingResult page = new PagingResult();
    page.setPageNumber(pageNumber);
    page.setNumberPerPage(size);
    try {
      return accountService.page(dto, page);
    } catch (Exception e) {
      logger.error("Have an error on method categoryListSearch:" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @PostMapping("/add-pay-card/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity addPayCard(@PathVariable("id") String id,
      @RequestBody PayCardDTO dto, HttpServletRequest request) {
    try {
      return accountService.addPayCard(id, dto);
    } catch (Exception e) {
      logger.error("Have a error method addPayCard():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @PostMapping("/lock/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity lockAccount(@PathVariable("id") String id, HttpServletRequest request) {
    try {
      return accountService.lockAccount(id);
    } catch (Exception e) {
      logger.error("Have a error method lockAcount():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @PostMapping("/unlock/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity unlockAccount(@PathVariable("id") String id, HttpServletRequest request) {
    try {
      return accountService.unlockAccount(id);
    } catch (Exception e) {
      logger.error("Have a error method unlockAcount():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

}
