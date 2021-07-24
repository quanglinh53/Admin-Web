package com.osp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class DocumentDTO {

  private String id;

  private String accountId;

  private AccountDTO account;

  private Integer categoryId;

  private CategoryDTO category;

  private BigDecimal price;

  private String title;

  private String description;

  private String thumbnail;

  private String image;

  private Integer viewsNumber=0;

  private String link;

  private String documentFile;

  private Date createdDate;

  private Date updatedDate;

  private Integer status=0;

  private String tag;

  private Float rate;

  @JsonProperty(access = Access.WRITE_ONLY)
  private String accountName;
}
