package com.osp.web.dao.content;

import com.osp.common.Constant;
import com.osp.common.PagingResult;
import com.osp.model.Category2;
import com.osp.web.service.logaccess.LogAccessService;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Admin on 2/26/2018.
 */
@Repository
@Transactional
public class CategoryDao2Impl implements Category2Dao {
    private Logger logger= LogManager.getLogger(CategoryDao2Impl.class);
    @PersistenceContext(unitName = "appAdmin")
    @Qualifier(value = "transactionManager")
    private EntityManager entityManager;

/*    @PersistenceContext*//*(unitName = "appCustomer")*//*
    private EntityManager entityManager;

    @PersistenceUnit*//*(unitName = "appCustomer")*//*
    private EntityManagerFactory entityManagerFactory;*/

    @Autowired
    LogAccessService logAccessService;

    @Override
    public List<Category2> listByRoot() {
        List<Category2> list = new ArrayList<>();
        String query = "select bo from Category2 bo where 1=1 and parentId =0 order by id desc";
        list = entityManager.createQuery(query, Category2.class).getResultList();
        return list;
    }

    @Override
    public Category2 ltsByUrl(String url) {
        String query = "select bo.* from tqc_category bo where 1=1 and url ='"+url+"'";
        return (Category2) entityManager.createNativeQuery(query, Category2.class).getSingleResult();
    }

    @Override
    public List<Category2> ltsByOn() {
        List<Category2> list = new ArrayList<>();
        String query = "select bo from Category2 bo where 1=1 and bo.status="+ Constant.STATUS_CATEGORY_ON+" order by id desc";
        list = entityManager.createQuery(query, Category2.class).getResultList();
        return list;
    }

    @Override
    public List<Category2> ltsByIdRoot(Integer parentId, Integer status) {
        List<Category2> list = new ArrayList<>();
        String query = "select bo from Category2 bo where 1=1 and parentId =:parentId and status =:status order by id desc";
        list = entityManager.createQuery(query, Category2.class).setParameter("status",status).setParameter("parentId",parentId).getResultList();
        return list;
    }

    @Override
    public PagingResult page(PagingResult page, String name) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        int offset=0;
        if(page.getPageNumber()>0) offset=(page.getPageNumber()-1)*page.getNumberPerPage();
        CriteriaQuery<Category2> q = cb.createQuery(Category2.class);
        Root<Category2> root = q.from(Category2.class);
        List<Predicate> predicates = new ArrayList<Predicate>();
        if(StringUtils.isNotBlank(name)){
            predicates.add(cb.like(root.get("name"),"%"+name+"%"));
        }
        q.select(root).where(predicates.toArray(new Predicate[]{}));
        List<Category2> list = entityManager.createQuery(q).setFirstResult(offset).setMaxResults(page.getNumberPerPage()).getResultList();
        if (list != null) {
            page.setItems(list);
        }
        CriteriaQuery<Long> criteriaQuery = cb.createQuery(Long.class);
        Root<Category2> rootCount = criteriaQuery.from(Category2.class);
        criteriaQuery.select(cb.count(rootCount)).where(predicates.toArray(new Predicate[]{}));
        Long rowCount = entityManager.createQuery(criteriaQuery).getSingleResult();
        if (rowCount != null) {
            page.setRowCount(rowCount.longValue());
        }
        return page;
    }

    @Override
    public List<Category2> list() {
        List<Category2> list = new ArrayList<>();
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Category2> q = cb.createQuery(Category2.class);
        Root<Category2> root = q.from(Category2.class);
        List<Predicate> predicates = new ArrayList<Predicate>();
        q.select(root).where(predicates.toArray(new Predicate[]{}));
        list = entityManager.createQuery(q).getResultList();
        return list;
    }


//    @Override
//    public List<Category> listBySearch(String search) {
//        List<Category> list = new ArrayList<>();
//        String query = "select bo from Category bo where 1=1 "+search;
//        list = entityManager.createQuery(query, Category.class).getResultList();
//        return list;
//    }
//
//
//    @Override
//    public List<Category> listByGroupTopicId(Long groupTopicId) {
//        List<Category> list = new ArrayList<>();
//        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
//        CriteriaQuery<Category> q = cb.createQuery(Category.class);
//        Root<Category> root = q.from(Category.class);
//        List<Predicate> predicates = new ArrayList<Predicate>();
//        predicates.add(cb.equal(root.get("groupTopicId"),groupTopicId));
//        q.select(root).where(predicates.toArray(new Predicate[]{}));
//        list = entityManager.createQuery(q).getResultList();
//        if (!list.isEmpty()) {
//            for (int i = 0; i < list.size(); i++) {
//                list.get(i).setFormaturl(Utils.seoUrl(list.get(i).getName(), list.get(i).getId().toString()));
//            }
//        }
//        return list;
//    }

//    @Override
//    public TopicViewIndex getTopicViewIndexById(Integer topicId) {
//        TopicViewIndex topicViewIndex = new TopicViewIndex();
//        String hql = "select category.id as categoryId, category.name as categoryName, \n" +
//                "article.id as newestPostId, \n" +
//                "article.TITLE as newestPostTitle, \n" +
//                "article.USER_CREATED as newestPostUserCreatedId, \n" +
//                "article.userFullName_created as newestPostUserCreatedFullName, \n" +
//                "article.DATE_CREATED as newestPostCreatedTime, \n" +
//                "(select count(DISTINCT(b.idcomment))+count(b.id) from tqc_recoment b,tqc_comment a WHERE a.post_id=newestPostId and a.id=b.idcomment) as countComment, \n" +
//                " (select count(article.id) from tqc_article article where article.CATEGORY_ID = category.id) as countPost, \n" +
//                "article.byCustomer as byCustomer from tqc_category category LEFT JOIN tqc_article article on category.id = article.category_id \n" +
//                "where category.id = "+topicId+"\n" +
//                "ORDER BY article.DATE_CREATED desc LIMIT 1";
//        try{
//            topicViewIndex = (TopicViewIndex) entityManager.createNativeQuery(hql, TopicViewIndex.class).getSingleResult();
//            topicViewIndex.setFormaturl(Utils.seoUrl(topicViewIndex.getCategoryName(), topicViewIndex.getCategoryId().toString()));
//        }
//        catch (Exception e){
//            e.printStackTrace();
//        }
//        return topicViewIndex;
//    }

    @Override
    public Category2 get(Integer id) {
        Category2 item = new Category2();
        item=entityManager.find(Category2.class,id);
        return item;
    }

    @Override
    public Integer getMaxValue() {
        Integer value=(Integer)entityManager.createQuery("Select max(c.value) from Category2 c").getSingleResult();
        return value;
    }

    @Override
    public Boolean add(Category2 item){
        try {
            entityManager.persist(item);
            entityManager.flush();
            return Boolean.valueOf(true);
        } catch (Exception e) {
            logger.error("Have error in add: "+e.getMessage());
            return Boolean.valueOf(false);
        }
    }

    @Override
    public Boolean edit(Category2 item){
        try {
            entityManager.merge(item);
            entityManager.flush();
            return true;
        } catch (Exception e) {
            logger.error("Have error in method edit: "+e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean delete(Integer id) {
        Category2 article=new Category2();
        try{
            article=entityManager.find(Category2.class,id);
            entityManager.remove(article);
        }
        catch (Exception e){
            logger.error("Have error in method CategoryDaImpl.delete: "+e.getMessage());
            return false;
        }
        return true;

    }

}
