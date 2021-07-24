package com.osp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;
import com.osp.model.admin.Account;
import com.osp.model.admin.TransactionForm;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class TransactionHistoryDTO {

  private String id;

  private Date transactionDate;

  private String customerId;

  private AccountDTO customer;

  private String sellerId;

  private AccountDTO seller;

  private String transactionFormId;

  private TransactionFormDTO transactionForm;

  private BigDecimal transactionMoney;

  private Integer feeMoney;

  private String transactionPosition;

  private Integer tradingOperation;

  private Integer status;

  @JsonProperty(access = Access.WRITE_ONLY)
  private String nguoiBan;

  @JsonProperty(access = Access.WRITE_ONLY)
  private String tuNgay;

  @JsonProperty(access = Access.WRITE_ONLY)
  private String denNgay;

}
