package com.osp.web.dao.mongoDAO;

import com.mongodb.client.MongoCollection;
import com.osp.common.Constant;
import com.osp.model.admin.User;
import com.osp.model.mongo.Article;
import com.osp.model.mongo.ArticleMongo;
import org.bson.Document;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
@Repository
public class ArticleDAOimpl implements ArticleDAO {
    @Override
    public List<Document> listPostHome(Long categoryId, Integer page, Integer numberPerPage, String text) {
        return null;
    }

    @Override
    public void addArtice(Article article) {

    }

    @Override
    public void edit(Article article) {

    }

    @Override
    public void del(Article article) {

    }
}
