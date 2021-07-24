package com.osp.model.admin;

import java.util.Date;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "mng_pay_card")
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class PayCard {

  @Id
  @GeneratedValue(generator = "UUID")
  @GenericGenerator(
      name = "UUID",
      strategy = "org.hibernate.id.UUIDGenerator"
  )
  @Column(name = "card_id", updatable = false, nullable = false, unique = true)
  private String id;

  @Column(name = "card_number", nullable = false, length = 100)
  private String cardNumber;

  @Column(name = "type", nullable = false, length = 100)
  private String type;

  @Column(name = "created_at", nullable = false)
  private Date createdAt;

  @Column(name = "updated_at", nullable = false)
  private Date updatedAt;

  @Column(name = "status", nullable = false)
  private Integer status;

  @PrePersist
  public void prePersist() {
    createdAt = new Date();
    updatedAt = new Date();
  }

  @PreUpdate
  public void preUpdate() {
    updatedAt = new Date();
  }

}