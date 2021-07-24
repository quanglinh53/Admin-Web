package com.osp.model.admin;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name = "mng_transaction_history")
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class TransactionHistory {

  @Id
  @GeneratedValue(generator = "UUID")
  @GenericGenerator(
      name = "UUID",
      strategy = "org.hibernate.id.UUIDGenerator"
  )
  @Column(name = "transaction_history_id", updatable = false, nullable = false, unique = true)
  private String id;

  @Column(name = "transaction_date", nullable = false)
  private Date transactionDate;

  @Column(name = "customer_id", nullable = false)
  private String customerId;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "customer_id", insertable = false, updatable = false)
  @NotFound(
      action = NotFoundAction.IGNORE)
  private Account customer;

  @Column(name = "seller_id", nullable = false)
  private String sellerId;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "seller_id", insertable = false, updatable = false)
  @NotFound(
      action = NotFoundAction.IGNORE)
  private Account seller;

  @Column(name = "transaction_form_id", nullable = false)
  private String transactionFormId;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "transaction_form_id", insertable = false, updatable = false)
  @NotFound(
      action = NotFoundAction.IGNORE)
  private TransactionForm transactionForm;

  @Column(name = "transaction_money", nullable = false)
  private BigDecimal transactionMoney;

  @Column(name = "fee_money", nullable = false)
  private Integer feeMoney;


  @Column(name = "transaction_position", length = 100)
  private String transactionPosition;

  /**
   * Thao tác (0: Mua, 1: Bán)
   */
  @Column(name = "trading_operation", nullable = false)
  private Integer tradingOperation;

  /**
   * Trạng thái giao dịch - 0: Chưa thực hiện giao dịch - 1: Đang giao dịch - 2: Thành công
   */
  @Column(name = "status", nullable = false)
  private Integer status;
}
