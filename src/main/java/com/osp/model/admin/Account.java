package com.osp.model.admin;

import java.util.Date;
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
@Table(name = "adm_account")
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class Account {

  @Id
  @GeneratedValue(generator = "UUID")
  @GenericGenerator(
      name = "UUID",
      strategy = "org.hibernate.id.UUIDGenerator"
  )
  @Column(name = "id", updatable = false, nullable = false, unique = true)
  private String id;

  @Column(name = "card_id", length = 50)
  private String cardId;

  @Column(name = "email", length = 100, nullable = false)
  private String email;

  @Column(name = "facebook_id", length = 250)
  private String faceBookId;

  @Column(name = "password", nullable = false, length = 250)
  private String password;

  @Column(name = "full_name", length = 250)
  private String fullname;

  @Column(name = "birthday")
  private Date birthday;

  @Column(name = "address")
  private String address;

  @Column(name = "phone", length = 15)
  private String phone;

  @Column(name = "vip_status", nullable = false)
  private Integer vipStatus;

  @Column(name = "vip_id", nullable = false)
  private String vipId;

  @Column(name = "vip_spend_time")
  private Date vipSpenTime;

  @Column(name = "is_customer")
  private Integer isCustomer;

  @Column(name = "is_seller")
  private Integer isSeller;

  @Column(name = "is_virtual_account")
  private Integer isVirtualAccount;

  @Column(name = "status", nullable = false)
  private Integer status;

  @Column(name = "times_to_top", nullable = false)
  private Integer timesToTop;

  @Column(name = "created_date", nullable = false)
  private Date createdDate;

  @Column(name = "updated_date", nullable = false)
  private Date updatedDate;

  @PrePersist
  public void prePersist() {
    createdDate = new Date();
    updatedDate = new Date();
  }

  @PreUpdate
  public void preUpdate() {
    updatedDate = new Date();
  }

}
