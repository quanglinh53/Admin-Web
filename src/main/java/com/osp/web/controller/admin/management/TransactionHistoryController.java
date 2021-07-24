package com.osp.web.controller.admin.management;

import com.osp.common.PagingResult;
import com.osp.dto.TransactionHistoryDTO;
import com.osp.web.service.management.TransactionHistoryService;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Admin on 2/26/2018.
 */
@Controller
@RequestMapping("/admin/management/transaction-history")
public class TransactionHistoryController {

  private Logger logger = LogManager.getLogger(TransactionHistoryController.class);

  @Autowired
  TransactionHistoryService service;


  @GetMapping("/list")
//  @Secured(ConstantAuthor.Category.view)
  public String TransactionHistoryList(Model model) {
    return "adm.transaction.history.list";
  }


  @PostMapping
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity TransactionHistoryAdd(@RequestBody TransactionHistoryDTO dto,
      HttpServletRequest request) {
    try {
      return service.add(dto);
    } catch (Exception e) {
      logger.error("Have a error method TransactionHistoryAdd():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }


  @GetMapping
//  @Secured(ConstantAuthor.Category.view)
  public ResponseEntity<PagingResult> TransactionHistorySearch(
      @RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber,
      @RequestParam(value = "size", required = false, defaultValue = "10") int size,
      TransactionHistoryDTO dto) {
    PagingResult page = new PagingResult();
    page.setPageNumber(pageNumber);
    page.setNumberPerPage(size);
    try {
      return service.page(dto, page);
    } catch (Exception e) {
      logger.error("Have an error on method categoryListSearch:" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }




}
