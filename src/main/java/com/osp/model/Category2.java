package com.osp.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Admin on 2/26/2018.
 */
@Entity
@Data
@Table(name = "tqc_category")
public class Category2 implements Serializable {
    private static final long serialVersionUID = -6202125778049294544L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "parentId", nullable = false)
    private Integer parentId;
    @Column(name = "name", nullable = false)
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "date_created", nullable = false)
    private Date dateCreated;
    @Column(name = "user_created", nullable = false)
    private Long userCreated;
    @Column(name = "date_updated", nullable = false)
    private Date dateUpdated;
    @Column(name = "user_updated", nullable = false)
    private Long userUpdated;
    @Column(name = "status")
    private Integer status;
    @Column(name="url")
    private String url;

    @Transient
    private String formaturl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Long getUserCreated() {
        return userCreated;
    }

    public void setUserCreated(Long userCreated) {
        this.userCreated = userCreated;
    }

    public Date getDateUpdated() {
        return dateUpdated;
    }

    public void setDateUpdated(Date dateUpdated) {
        this.dateUpdated = dateUpdated;
    }

    public Long getUserUpdated() {
        return userUpdated;
    }

    public void setUserUpdated(Long userUpdated) {
        this.userUpdated = userUpdated;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getFormaturl() {
        return formaturl;
    }

    public void setFormaturl(String formaturl) {
        this.formaturl = formaturl;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
