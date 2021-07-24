package com.osp.dto;

import java.io.Serializable;
import java.util.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class TransactionFormDTO {

  private String id;

  private String transactionName;

  private Date createdAt;

  private Date updatedAt;

  private String createdBy;

  private String updatedBy;
}
