package com.osp.model.mongo;

import java.util.Date;

public class Article {
    private String _id;
    private String title;
    private Long categoryId;
    private Long categoryRoot;
    private String shortContent;
    private String thumbail;
    private String content;
    private String userCreate;
    private String userApporve;
    private Date genDate;
    private String userApporved;
    private Date aprroveDate;
    private Long status;

    public String getUserApporved() {
        return userApporved;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public void setUserApporved(String userApporved) {
        this.userApporved = userApporved;
    }

    public Date getAprroveDate() {
        return aprroveDate;
    }

    public void setAprroveDate(Date aprroveDate) {
        this.aprroveDate = aprroveDate;
    }

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getCategoryRoot() {
        return categoryRoot;
    }

    public void setCategoryRoot(Long categoryRoot) {
        this.categoryRoot = categoryRoot;
    }

    public String getThumbail() {
        return thumbail;
    }

    public void setThumbail(String thumbail) {
        this.thumbail = thumbail;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserCreate() {
        return userCreate;
    }

    public void setUserCreate(String userCreate) {
        this.userCreate = userCreate;
    }

    public String getUserApporve() {
        return userApporve;
    }

    public void setUserApporve(String userApporve) {
        this.userApporve = userApporve;
    }

    public Date getGenDate() {
        return genDate;
    }

    public void setGenDate(Date genDate) {
        this.genDate = genDate;
    }



    public String getShortContent() {
        return shortContent;
    }

    public void setShortContent(String shortContent) {
        this.shortContent = shortContent;
    }
}
