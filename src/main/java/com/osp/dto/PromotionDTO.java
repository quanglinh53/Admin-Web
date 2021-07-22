package com.osp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;
import java.util.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PromotionDTO {

  private String id;

  private Integer type;

  private String code;

  private String title;

  private String description;

  private Date duration;

  private Date createdDate;

  private Date updatedDate;

  private String createdBy;

  private String updatedBy;

  private Integer value;

  @JsonProperty(access = Access.WRITE_ONLY)
  private String ngayDang;
}
