package com.osp.web.dao.mongoDAO;

import com.osp.model.mongo.Article;
import org.bson.Document;

import java.util.List;

public interface ArticleDAO {
    public List<Document> listPostHome(Long categoryId, Integer page, Integer numberPerPage, String text);
    void addArtice(Article article);
    void edit(Article article);
    void del(Article article);
}
