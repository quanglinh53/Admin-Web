package com.osp.web.dao.management;


import com.osp.common.PagingResult;
import com.osp.dto.TransactionHistoryDTO;
import com.osp.model.admin.TransactionHistory;
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
public class TransactionHistoryDaoImpl implements TransactionHistoryDao {

  private org.apache.logging.log4j.Logger logger = LogManager
      .getLogger(TransactionHistoryDaoImpl.class);
  @PersistenceContext(unitName = "appAdmin")
  @Qualifier(value = "transactionManager")
  private EntityManager entityManager;

  @Override
  public TransactionHistory add(TransactionHistory entity) {
    entityManager.persist(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public void del(String id) {
    TransactionHistory TransactionHistory = entityManager.find(TransactionHistory.class, id);
    entityManager.remove(TransactionHistory);
  }

  @Override
  public TransactionHistory edit(TransactionHistory entity) {
    entityManager.merge(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public TransactionHistory get(String id) {
    TransactionHistory TransactionHistory = entityManager.find(TransactionHistory.class, id);
    return TransactionHistory;
  }

  @Override
  public Optional<PagingResult> page(PagingResult page, TransactionHistoryDTO dto) {
    User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    int offset = 0;
    if (page.getPageNumber() > 0) {
      offset = (page.getPageNumber() - 1) * page.getNumberPerPage();
    }
    String condition = "";

    try {

      if (!StringUtils.isEmpty(dto.getNguoiBan())) {
        condition += " AND LOWER (sl.fullname) LIKE :nguoiBan ";
      }

      if (dto.getStatus() != null) {
        condition += " AND a.status = :status ";
      }

      if (!StringUtils.isEmpty(dto.getTuNgay())) {
        condition += " AND date_format(a.transactionDate,'%Y-%m-%d') >= :tuNgay ";
      }

      if (!StringUtils.isEmpty(dto.getDenNgay())) {
        condition += " AND date_format(a.transactionDate,'%Y-%m-%d') <= :denNgay ";
      }

      Query query = entityManager.createQuery(
          "select a from  TransactionHistory a"
              + " left join a.seller sl where 1=1 " + condition + " order by a.id desc",
          TransactionHistory.class);

      if (!StringUtils.isEmpty(dto.getNguoiBan())) {
        query.setParameter("nguoiBan", "%" + dto.getNguoiBan().toLowerCase() + "%");
      }

      if (dto.getStatus() != null) {
        query.setParameter("status", dto.getStatus());
      }

      if (!StringUtils.isEmpty(dto.getTuNgay())) {
        query.setParameter("tuNgay", DateTimeUtils.converDate(dto.getTuNgay()));
      }

      if (!StringUtils.isEmpty(dto.getDenNgay())) {
        query.setParameter("denNgay", DateTimeUtils.converDate(dto.getDenNgay()));
      }

      List<TransactionHistory> list = query.setFirstResult(offset)
          .setMaxResults(page.getNumberPerPage()).getResultList();
      if (list != null && list.size() > 0) {
        page.setItems(list);
      }

      Query queryCount = entityManager
          .createQuery("select count(a.id) FROM  TransactionHistory a left join a.seller sl where 1=1 " + condition);

      if (!StringUtils.isEmpty(dto.getNguoiBan())) {
        queryCount.setParameter("nguoiBan", "%" + dto.getNguoiBan().toLowerCase() + "%");
      }

      if (dto.getStatus() != null) {
        queryCount.setParameter("status", dto.getStatus());
      }

      if (!StringUtils.isEmpty(dto.getTuNgay())) {
        queryCount.setParameter("tuNgay", DateTimeUtils.converDate(dto.getTuNgay()));
      }

      if (!StringUtils.isEmpty(dto.getDenNgay())) {
        queryCount.setParameter("denNgay", DateTimeUtils.converDate(dto.getDenNgay()));
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
