package com.osp.web.dao.content;

import com.osp.common.PagingResult;
import com.osp.model.Article;
import com.osp.model.Category2;

import java.util.List;
import java.util.Optional;

/**
 * Created by Admin on 2/26/2018.
 */
public interface ArticleDao {
    Optional<PagingResult> page(PagingResult page, String name,Integer status);
    Optional<PagingResult> publicHome(PagingResult page, String title, Integer status,
        Category2 category);
    public Article add(Article article);
    public void del(Integer id);
    public void edit(Article article);
    public Article search(Article article);
    public Article get(Integer id);
    public Article getByUrl(String url);
    public List<Article> top();
    public List<Article> lienquan(Integer categoryId);



}
