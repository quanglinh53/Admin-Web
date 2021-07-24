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
@Table(name = "adm_document")
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class Document {

  @Id
  @GeneratedValue(generator = "UUID")
  @GenericGenerator(
      name = "UUID",
      strategy = "org.hibernate.id.UUIDGenerator"
  )
  @Column(name = "id", updatable = false, nullable = false, unique = true)
  private String id;

  @Column(name = "account_id", nullable = false)
  private String accountId;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "account_id", insertable = false, updatable = false)
  @NotFound(
      action = NotFoundAction.IGNORE)
  private Account account;

  @Column(name = "category_id", nullable = false)
  private Integer categoryId;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "category_id", insertable = false, updatable = false)
  @NotFound(
      action = NotFoundAction.IGNORE)
  private Category category;

  @Column(nullable = false)
  private BigDecimal price;

  @Column(name = "title", length = 100, nullable = false)
  private String title;

  @Column(name = "description", length = 300, nullable = false)
  private String description;

  @Column(name = "thumbnail", length = 100)
  private String thumbnail;

  @Column(name = "image", length = 100)
  private String image;

  @Column(name = "views_number", nullable = false)
  private Integer viewsNumber;

  @Column(name = "link", length = 300, nullable = false)
  private String link;

  @Column(name = "document_file", length = 100)
  private String documentFile;

  @Column(name = "created_date", nullable = false)
  private Date createdDate;

  @Column(name = "updated_date", nullable = false)
  private Date updatedDate;

  private Integer status;

  private String tag;

  private Float rate;

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
