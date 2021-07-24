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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name = "adm_job")
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class Job {

  @Id
  @GeneratedValue(generator = "UUID")
  @GenericGenerator(
      name = "UUID",
      strategy = "org.hibernate.id.UUIDGenerator"
  )
  @Column(name = "id", updatable = false, nullable = false, unique = true)
  private String id;

  @Column(name = "employer_id", nullable = false)
  private String employerId;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "employer_id", insertable = false, updatable = false)
  @NotFound(
      action = NotFoundAction.IGNORE)
  private Account employer;

  @Column(name = "employee_id", nullable = false)
  private String employeeId;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "employee_id", insertable = false, updatable = false)
  @NotFound(
      action = NotFoundAction.IGNORE)
  private Account employee;

  @Column(name = "category_id", nullable = false)
  private Integer categoryId;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "category_id", insertable = false, updatable = false)
  @NotFound(
      action = NotFoundAction.IGNORE)
  private Category category;

  @Column(name = "offer_from",nullable = false)
  private BigDecimal offerFrom;

  @Column(name = "offer_to",nullable = false)
  private BigDecimal offerTo;

  @Column(name = "duration",nullable = false)
  private Date duration;

  @Column(name = "tilte", length = 100, nullable = false)
  private String title;

  @Column(name = "description", length = 500, nullable = false)
  private String description;

  @Column(name = "thumbnail", length = 100)
  private String thumbnail;

  @Column(name = "image", length = 100)
  private String image;

  @Column(name = "created_date", nullable = false)
  private Date createdDate;

  @Column(name = "updated_date", nullable = false)
  private Date updatedDate;

  private Integer status;

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
