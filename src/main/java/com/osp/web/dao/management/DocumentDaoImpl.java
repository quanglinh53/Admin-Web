package com.osp.web.dao.management;


import com.osp.common.PagingResult;
import com.osp.dto.DocumentDTO;
import com.osp.model.admin.Document;
import com.osp.model.admin.User;
import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Repository
@Transactional(value = "transactionManager")
public class DocumentDaoImpl implements DocumentDao {

  private org.apache.logging.log4j.Logger logger = LogManager.getLogger(DocumentDaoImpl.class);
  @PersistenceContext(unitName = "appAdmin")
  @Qualifier(value = "transactionManager")
  private EntityManager entityManager;

  @Override
  public Document add(Document entity) {
    entityManager.persist(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public void del(String id) {
    Document document = entityManager.find(Document.class, id);
    entityManager.remove(document);
  }

  @Override
  public Document edit(Document entity) {
    entityManager.merge(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public Document get(String id) {
    Document document = entityManager.find(Document.class, id);
    return document;
  }

  @Override
  public Optional<PagingResult> page(PagingResult page, DocumentDTO dto) {
    User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    int offset = 0;
    if (page.getPageNumber() > 0) {
      offset = (page.getPageNumber() - 1) * page.getNumberPerPage();
    }
    String condition = "";

    try {

      if (!StringUtils.isEmpty(dto.getAccountName())) {
        condition += " AND LOWER (e.fullname) LIKE :account ";
      }

      if (!StringUtils.isEmpty(dto.getTitle())) {
        condition += " AND LOWER (a.title) LIKE :title ";
      }

      Query query = entityManager
          .createQuery("select a from Document a "
              + " left join a.account e "
              + " where 1=1 " + condition, Document.class);

      if (!StringUtils.isEmpty(dto.getAccountName())) {
        query.setParameter("account", "%" + dto.getAccountName().toLowerCase() + "%");
      }

      if (!StringUtils.isEmpty(dto.getTitle() )) {
        query.setParameter("title", "%" + dto.getTitle().toLowerCase() + "%");
      }


      List<Document> list = query.setFirstResult(offset).setMaxResults(page.getNumberPerPage())
          .getResultList();
      if (list != null && list.size() > 0) {
        page.setItems(list);
      }

      Query queryCount = entityManager
          .createQuery("select count(a.id) "
              + " FROM Document a "
              + " left join a.account e "
              + " where 1=1 " + condition);

      if (!StringUtils.isEmpty(dto.getAccountName())) {
        queryCount.setParameter("account", "%" + dto.getAccountName().toLowerCase() + "%");
      }

      if (!StringUtils.isEmpty(dto.getTitle() )) {
        queryCount.setParameter("title", "%" + dto.getTitle().toLowerCase() + "%");
      }

      int count = ((Number) queryCount.getSingleResult()).intValue();
      page.setRowCount(count);
      page.setUserLogin(user);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return Optional.ofNullable(page);
  }
}
