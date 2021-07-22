package com.osp.web.controller.admin.management;

import com.osp.dto.PayCardDTO;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Admin on 2/26/2018.
 */
@Controller
@RequestMapping("/admin/management/pay-card")
public class PayCardController {

  private Logger logger = LogManager.getLogger(PayCardController.class);

  @Autowired
  AccountService accountService;

  @Autowired
  PayCardService payCardService;

  @Autowired
  TransactionFormService transactionFormService;

  @PostMapping
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity payCardAdd(@RequestBody PayCardDTO dto, HttpServletRequest request) {
    try {
      return payCardService.add(dto);
    } catch (Exception e) {
      logger.error("Have a error method payCardAdd():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }


}
