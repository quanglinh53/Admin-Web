package com.osp.web.dao.content;

import com.osp.common.Constant;
import com.osp.common.PagingResult;
import com.osp.model.Article;
import com.osp.model.Category2;
/*import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;*/
import com.osp.model.admin.User;
import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

/**
 * Created by Admin on 2/26/2018.
 */
@Repository
@Transactional(value = "transactionManager")
public class ArticleDaoImpl implements ArticleDao {
    private org.apache.logging.log4j.Logger logger = LogManager.getLogger(ArticleDaoImpl.class);
    @PersistenceContext(unitName = "appAdmin")
    @Qualifier(value = "transactionManager")
    private EntityManager entityManager;
    //    @Qualifier("sfAccounting")
//    @Autowired
//    private SessionFactory sessionFactory;
    @Autowired
    Category2Dao categoryDao;


    private final Pattern NONLATIN = Pattern.compile("[^\\w-]");
    private final Pattern WHITESPACE = Pattern.compile("[\\s]");

    @Override
    public Optional<PagingResult> page(PagingResult page, String title,Integer status) {
        List<Article> lts = new ArrayList<>();
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        int offset = 0;
        if (page.getPageNumber() > 0) {
            page.setNumberPerPage(10);
            offset = (page.getPageNumber() - 1) * page.getNumberPerPage();
        }
        String condition = "";
        if(user.getRole()==0){
            condition = " AND a.USER_CREATED ='"+user.getUsername()+"'";
        }else{
            condition= " AND a.status!=0 OR a.USER_CREATED ='"+user.getUsername()+"'";
        }
        try {
            if (title != null) {
                condition = " AND LOWER (a.title) LIKE '%" + title.toLowerCase() + "%'";
            }
            if (status != null) {
                condition = " AND a.status =:status";
            }
            String sql = "select a.* from `tqc_article` a where 1=1 " + condition + " order by a.id desc";
            Query query = entityManager.createNativeQuery(sql, Article.class);
            if(status!=null){
                query.setParameter("status",status);
            }
            String sqlCount = "";
            List<Object[]> list = query.setFirstResult(offset).setMaxResults(page.getNumberPerPage()).getResultList();
            if (list != null && list.size() > 0) {
                page.setItems(list);
            }

            sqlCount = "select count(*) FROM (" + sql + ") as a";
            Query queryCount = entityManager.createNativeQuery(sqlCount);

            int count = ((Number) queryCount.getSingleResult()).intValue();
            page.setRowCount(count);
            page.setUserLogin(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Optional.ofNullable(page);
    }

    public List<Category2> ltsByIdRoot(Integer parentId) {
        List<Category2> list = new ArrayList<>();
        String query = "select bo from Category bo where 1=1 and parentId =:parentId and parentId <>0 and status =:status order by id desc";
        list = entityManager.createQuery(query, Category2.class).setParameter("status",Constant.STATUS_CATEGORY_ON).setParameter("parentId",parentId).getResultList();
        return list;
    }
    @Override
    public Optional<PagingResult> publicHome(PagingResult page, String title, Integer status,
        Category2 category) {
        List<Article> lts = new ArrayList<>();

        int offset = 0;
        if (page.getPageNumber() > 0) {
            page.setNumberPerPage(10);
            offset = (page.getPageNumber() - 1) * page.getNumberPerPage();
        }
        String condition = "";
        try {
            if (title != null) {
                condition = condition + " AND LOWER (a.title) LIKE '%" + title.toLowerCase() + "%'";
            }
            if (status != null) {
                condition = condition + " AND a.status =:status";
            }
            if (category != null) {
                if(category.getParentId()!=0){
                    condition = condition + " AND (a.CATEGORY_ID ="+category.getId()+" OR a.CATEGORY_ID ="+category.getParentId()+")";
                }else {
                    List<Category2> ltsCategories=new ArrayList<>();
                    ltsCategories=ltsByIdRoot(category.getId());
                    condition =condition+ " AND a.CATEGORY_ID ="+category.getId();
                    for(Category2 category2:ltsCategories){
                        condition =condition+ " OR a.CATEGORY_ID ="+category2.getId();
                    }
                }


            }
            String sql = "select a.* from `tqc_article` a where 1=1 " + condition + " order by a.DATE_UPDATED desc";
            String sqlCount = "";


            sqlCount = "select count(*) FROM (" + sql + ") as a";
            Query queryCount = entityManager.createNativeQuery(sqlCount);
            Query query = entityManager.createNativeQuery(sql, Article.class);
            if(status!=null){
                query.setParameter("status",status);
                queryCount.setParameter("status",status);
            }

            List<Object[]> list = query.setFirstResult(offset).setMaxResults(page.getNumberPerPage()).getResultList();
            if (list != null && list.size() > 0) {
                page.setItems(list);
            }
            int count = ((Number) queryCount.getSingleResult()).intValue();
            page.setRowCount(count);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return Optional.ofNullable(page);
    }

    @Override
    public Article add(Article article) {
        entityManager.persist(article);
        entityManager.flush();
        return article;
    }

    @Override
    public void del(Integer id) {
        Article article = new Article();
        article = entityManager.find(Article.class, id);
        entityManager.remove(article);

    }

    @Override
    public void edit(Article article) {
        entityManager.merge(article);
        entityManager.flush();
    }

    @Override
    public Article search(Article article) {
        return null;
    }

    @Override
    public Article get(Integer id) {
        Article article = new Article();
        article = entityManager.find(Article.class, id);
        return article;
    }

    @Override
    public Article getByUrl(String url) {
        Query query=entityManager.createQuery("select a from Article a where url =:url");
        return (Article) query.setParameter("url",url).getSingleResult();
    }

    @Override
    public List<Article> top() {
     Query query=entityManager.createQuery("select a from Article a where a.status=2 order by a.view desc");
     return query.setFirstResult(0).setMaxResults(5).getResultList();
    }

    @Override
    public List<Article> lienquan(Integer categoryId) {
        Query query=entityManager.createQuery("select a from Article a where a.status=2 and a.categoryId =:categoryId");
        return query.setParameter("categoryId",categoryId).setFirstResult(0).setMaxResults(8).getResultList();
    }
    /* private Logger logger= LogManager.getLogger(ArticleDaoImpl.class);*/

}
