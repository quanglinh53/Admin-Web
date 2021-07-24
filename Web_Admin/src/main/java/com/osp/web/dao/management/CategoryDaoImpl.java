package com.osp.web.dao.management;

import com.osp.common.PagingResult;
import com.osp.dto.CategoryDTO;
import com.osp.model.admin.Category;
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

@Repository
@Transactional(value = "transactionManager")
public class CategoryDaoImpl implements CategoryDao{

  private org.apache.logging.log4j.Logger logger = LogManager.getLogger(CategoryDaoImpl.class);
  @PersistenceContext(unitName = "appAdmin")
  @Qualifier(value = "transactionManager")
  private EntityManager entityManager;

  @Override
  public Category add(Category entity) {
    entityManager.persist(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public void del(int id) {
    Category category = entityManager.find(Category.class, id);
    entityManager.remove(category);
  }

  @Override
  public Category edit(Category entity) {
    entityManager.merge(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public Category get(int id) {
    Category category = entityManager.find(Category.class, id);
    return category;
  }

  @Override
  public Optional<PagingResult> page(PagingResult page, CategoryDTO dto) {
    User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    int offset = 0;
    if (page.getPageNumber() > 0) {
      offset = (page.getPageNumber() - 1) * page.getNumberPerPage();
    }
    String condition = "";

    try {

      if (dto.getName() != null) {
        condition += " AND LOWER (e.name) LIKE :name ";
      }

      Query query = entityManager.createQuery("select e from Category e where 1=1 " + condition, Category.class);

      if (dto.getName() != null) {
        query.setParameter("name", "%" + dto.getName().toLowerCase() + "%");
      }

      List<Category> list = query.setFirstResult(offset).setMaxResults(page.getNumberPerPage()).getResultList();
      if (list != null && list.size() > 0) {
        page.setItems(list);
      }

      Query queryCount = entityManager.createQuery("select count(e.id) FROM Category e where 1=1 " + condition);

      if (dto.getName() != null) {
        queryCount.setParameter("name", "%" + dto.getName().toLowerCase() + "%");
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
