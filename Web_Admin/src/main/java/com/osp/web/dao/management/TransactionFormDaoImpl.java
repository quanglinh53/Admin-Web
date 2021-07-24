package com.osp.web.dao.management;


import com.osp.common.PagingResult;
import com.osp.dto.TransactionFormDTO;
import com.osp.model.admin.TransactionForm;
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
public class TransactionFormDaoImpl implements TransactionFormDao {

  private org.apache.logging.log4j.Logger logger = LogManager
      .getLogger(TransactionFormDaoImpl.class);
  @PersistenceContext(unitName = "appAdmin")
  @Qualifier(value = "transactionManager")
  private EntityManager entityManager;

  @Override
  public TransactionForm add(TransactionForm entity) {
    entityManager.persist(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public void del(String id) {
    TransactionForm transactionForm = entityManager.find(TransactionForm.class, id);
    entityManager.remove(transactionForm);
  }

  @Override
  public TransactionForm edit(TransactionForm entity) {
    entityManager.merge(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public TransactionForm get(String id) {
    TransactionForm transactionForm = entityManager.find(TransactionForm.class, id);
    return transactionForm;
  }

  @Override
  public Optional<PagingResult> page(PagingResult page, TransactionFormDTO dto) {
    User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    int offset = 0;
    if (page.getPageNumber() > 0) {
      offset = (page.getPageNumber() - 1) * page.getNumberPerPage();
    }
    String condition = "";

    try {

      if (dto.getTransactionName() != null) {
        condition += " AND LOWER (a.transactionName) LIKE :name ";
      }

      Query query = entityManager.createQuery(
          "select a from  TransactionForm a where 1=1 " + condition + " order by a.id desc",
          TransactionForm.class);

      if (dto.getTransactionName() != null) {
        query.setParameter("name", "%" + dto.getTransactionName().toLowerCase() + "%");
      }

      List<TransactionForm> list = query.setFirstResult(offset)
          .setMaxResults(page.getNumberPerPage()).getResultList();
      if (list != null && list.size() > 0) {
        page.setItems(list);
      }

      Query queryCount = entityManager
          .createQuery("select count(a.id) FROM  TransactionForm a where 1=1 " + condition);
      if (dto.getTransactionName() != null) {
        queryCount.setParameter("name", "%" + dto.getTransactionName().toLowerCase() + "%");
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
