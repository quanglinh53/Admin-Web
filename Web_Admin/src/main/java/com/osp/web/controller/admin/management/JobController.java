package com.osp.web.controller.admin.management;

import com.osp.common.PagingResult;
import com.osp.dto.JobDTO;
import com.osp.web.service.management.AccountService;
import com.osp.web.service.management.JobService;
import com.osp.web.service.management.PayCardService;
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
@RequestMapping("/admin/management/job")
public class JobController {

  private Logger logger = LogManager.getLogger(JobController.class);

  @Autowired
  AccountService accountService;

  @Autowired
  PayCardService payCardService;

  @Autowired
  JobService jobService;


  @PostMapping
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity jobAdd(@RequestBody JobDTO dto,
      HttpServletRequest request) {
    try {
      return jobService.add(dto);
    } catch (Exception e) {
      logger.error("Have a error method jobAdd():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @PutMapping("/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity jobEdit(
      @PathVariable("id") String id,
      @RequestBody JobDTO dto, HttpServletRequest request) {
    try {
      return jobService.edit(id, dto);
    } catch (Exception e) {
      logger.error("Have a error method jobEdit():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @DeleteMapping("/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity jobDelete(@PathVariable("id") String id,
      HttpServletRequest request) {
    try {
      return jobService.delete(id);
    } catch (Exception e) {
      logger.error("Have a error method jobDelete():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @GetMapping
//  @Secured(ConstantAuthor.Category.view)
  public ResponseEntity<PagingResult> jobSearch(
      @RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber,
      @RequestParam(value = "size", required = false, defaultValue = "10") int size,
      JobDTO dto) {
    PagingResult page = new PagingResult();
    page.setPageNumber(pageNumber);
    page.setNumberPerPage(size);
    try {
      return jobService.page(dto, page);
    } catch (Exception e) {
      logger.error("Have an error on method categoryListSearch:" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }

  @GetMapping("/list")
//  @Secured(ConstantAuthor.Category.view)
  public String jobList(Model model) {
    return "adm.job.list";
  }


  @PostMapping("/change-status/{id}")
//  @Secured(ConstantAuthor.Category.add)
  public ResponseEntity chaneStatus(@RequestBody JobDTO dto, @PathVariable String id,
      HttpServletRequest request) {
    try {
      return jobService.changeStatus(id, dto.getStatus());
    } catch (Exception e) {
      logger.error("Have a error method jobAdd():" + e.getMessage());
      return new ResponseEntity("Co loi xay ra", HttpStatus.OK);
    }
  }
}
