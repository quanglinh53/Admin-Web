package com.osp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;
import com.osp.model.admin.Account;
import com.osp.model.admin.Category;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Getter
@Setter
@NoArgsConstructor
public class JobDTO {

  private String id;

  private String employerId;

  private AccountDTO employer;

  private String employeeId;

  private AccountDTO employee;

  private Integer categoryId;

  private CategoryDTO category;

  private BigDecimal offerFrom;

  private BigDecimal offerTo;

  private Date duration;

  private String title;

  private String description;

  private String thumbnail;

  private String image;

  private Date createdDate;

  private Date updatedDate;

  private Integer status = 0;

  @JsonProperty(access = Access.WRITE_ONLY)
  private String employerName;

  @JsonProperty(access = Access.WRITE_ONLY)
  private String tuNgay;

  @JsonProperty(access = Access.WRITE_ONLY)
  private String denNgay;

}
