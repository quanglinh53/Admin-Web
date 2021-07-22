package com.osp.model.admin;

import com.osp.utils.StrUtils;
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
@Table(name = "adm_promotion")
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class Promotion {

  @Id
  @GeneratedValue(generator = "UUID")
  @GenericGenerator(
      name = "UUID",
      strategy = "org.hibernate.id.UUIDGenerator"
  )
  @Column(name = "id", updatable = false, nullable = false, unique = true)
  private String id;

  @Column(name = "type", nullable = false)
  private Integer type;

  @Column(name = "code", nullable = false, length = 20)
  private String code;

  @Column(name = "title", nullable = false, length = 100)
  private String title;

  @Column(name = "description", nullable = false, length = 300)
  private String description;

  @Column(name = "duration", nullable = false)
  private Date duration;

  @Column(name = "created_date", nullable = false)
  private Date createdDate;

  @Column(name = "updated_date", nullable = false)
  private Date updatedDate;

  @PrePersist
  public void prePersist() {
    createdDate = new Date();
    updatedDate = new Date();
    code = StrUtils.generateRandomString(10);
  }

  @PreUpdate
  public void preUpdate() {
    updatedDate = new Date();
  }

  @Column(name = "created_by")
  private String createdBy;

  @Column(name = "updated_by")
  private String updatedBy;

  @Column
  private Integer value;

}
