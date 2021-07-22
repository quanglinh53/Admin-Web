package com.osp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class AccountDTO {

  private String id;

  private String cardId;

  private String email;

  private String faceBookId;

  @JsonProperty(access = Access.WRITE_ONLY)
  private String password;

  private String fullname;

  private Date birthday;

  private String address;

  private String phone;

  private Integer vipStatus;

  private String vipId;

  private Date vipSpenTime;

  private Integer isCustomer;

  private Integer isSeller;

  private Integer isVirtualAccount;

  private Integer status;

  private Integer timesToTop;

  private Date createdDate;

  private Date updatedDate;

}
