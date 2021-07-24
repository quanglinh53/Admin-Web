package com.osp.web.dao.management;


import com.osp.common.PagingResult;
import com.osp.dto.PromotionDTO;
import com.osp.model.admin.Promotion;
import com.osp.model.admin.User;
import com.osp.utils.DateTimeUtils;
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
public class PromotionDaoImpl implements PromotionDao {

  private org.apache.logging.log4j.Logger logger = LogManager
      .getLogger(PromotionDaoImpl.class);
  @PersistenceContext(unitName = "appAdmin")
  @Qualifier(value = "transactionManager")
  private EntityManager entityManager;

  @Override
  public Promotion add(Promotion entity) {
    entityManager.persist(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public void del(String id) {
    Promotion transactionForm = entityManager.find(Promotion.class, id);
    entityManager.remove(transactionForm);
  }

  @Override
  public Promotion edit(Promotion entity) {
    entityManager.merge(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public Promotion get(String id) {
    Promotion transactionForm = entityManager.find(Promotion.class, id);
    return transactionForm;
  }

  @Override
  public Optional<PagingResult> page(PagingResult page, PromotionDTO dto) {
    User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    int offset = 0;
    if (page.getPageNumber() > 0) {
      offset = (page.getPageNumber() - 1) * page.getNumberPerPage();
    }
    String condition = "";

    try {

      if (dto.getType() != null) {
        condition += " AND a.type = :type ";
      }

      if (!StringUtils.isEmpty(dto.getNgayDang())) {
        condition += " AND date_format(a.createdDate,'%Y-%m-%d') = :ngayDang ";
      }

      Query query = entityManager.createQuery(
          "select a from Promotion a where 1=1 " + condition + " order by a.id desc",
          Promotion.class);

      if (dto.getType() != null) {
        query.setParameter("type", dto.getType());
      }

      if (!StringUtils.isEmpty(dto.getNgayDang())) {
        query.setParameter("ngayDang", DateTimeUtils.converDate(dto.getNgayDang()));
      }

      List<Promotion> list = query.setFirstResult(offset)
          .setMaxResults(page.getNumberPerPage()).getResultList();
      if (list != null && list.size() > 0) {
        page.setItems(list);
      }

      Query queryCount = entityManager
          .createQuery("select count(a.id) FROM  Promotion a where 1=1 " + condition);

      if (dto.getType() != null) {
        queryCount.setParameter("type", dto.getType());
      }

      if (!StringUtils.isEmpty(dto.getNgayDang())) {
        queryCount.setParameter("ngayDang", DateTimeUtils.converDate(dto.getNgayDang()));
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
