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
@Table(name = "tqc_article")
public class Article implements Serializable {

    private static final long serialVersionUID = -4552881075031869105L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private Integer id;
    @Column(name = "CONTENT", nullable = false)
    private String content;
    @Column(name = "TITLE", nullable = false)
    private String title;
    @Column(name = "SHORT_CONTENT")
    private String shortContent;
    @Column(name = "DATE_CREATED", nullable = false)
    private Date dateCreated;
    @Column(name = "DATE_UPDATED", nullable = false)
    private Date dateUpdated;
    @Column(name = "USER_CREATED", nullable = false)
    private String userCreated;
    @Column(name = "USER_UPDATED", nullable = false)
    private String userUpdated;
    @Column(name="STATUS")
    private Integer status;
    @Column(name="THUMBAIL")
    private String thumbail;
    @Column(name = "CATEGORY_ID")
    private Integer categoryId;
    @Column(name="url")
    private String url;
    @Column(name="view")
    private Integer view;

    public Integer getView() {
        return view;
    }

    public void setView(Integer view) {
        this.view = view;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getThumbail() {
        return thumbail;
    }

    public void setThumbail(String thumbail) {
        this.thumbail = thumbail;
    }

    public String getShortContent() {
        return shortContent;
    }

    public void setShortContent(String shortContent) {
        this.shortContent = shortContent;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateUpdated() {
        return dateUpdated;
    }

    public void setDateUpdated(Date dateUpdated) {
        this.dateUpdated = dateUpdated;
    }

    public String getUserCreated() {
        return userCreated;
    }

    public void setUserCreated(String userCreated) {
        this.userCreated = userCreated;
    }

    public String getUserUpdated() {
        return userUpdated;
    }

    public void setUserUpdated(String userUpdated) {
        this.userUpdated = userUpdated;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
