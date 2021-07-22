package com.osp.web.dao.management;


import com.osp.common.PagingResult;
import com.osp.dto.AccountDTO;
import com.osp.model.admin.Account;
import com.osp.model.admin.User;
import java.util.List;
import java.util.Optional;
import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;

@Repository
@Transactional(value = "transactionManager")
public class AccountDaoImpl implements AccountDao {

  private org.apache.logging.log4j.Logger logger = LogManager.getLogger(AccountDaoImpl.class);
  @PersistenceContext(unitName = "appAdmin")
  @Qualifier(value = "transactionManager")
  private EntityManager entityManager;

  @Override
  public Account add(Account entity) {
    entityManager.persist(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public void del(String id) {
    Account account = entityManager.find(Account.class, id);
    entityManager.remove(account);
  }

  @Override
  public Account edit(Account entity) {
    entityManager.merge(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public Account get(String id) {
    Account account = entityManager.find(Account.class, id);
    return account;
  }

  @Override
  public Optional<PagingResult> page(PagingResult page, AccountDTO dto) {
    User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    int offset = 0;
    if (page.getPageNumber() > 0) {
      offset = (page.getPageNumber() - 1) * page.getNumberPerPage();
    }
    String condition = "";

    try {

      if (dto.getFullname() != null) {
        condition += " AND LOWER (e.fullname) LIKE :name ";
      }
     
      Query query = entityManager.createQuery("select e from Account e where 1=1 " + condition, Account.class);

      if (dto.getFullname() != null) {
        query.setParameter("name", "%" + dto.getFullname().toLowerCase() + "%");
      }

      List<Account> list = query.setFirstResult(offset).setMaxResults(page.getNumberPerPage()).getResultList();
      if (list != null && list.size() > 0) {
        page.setItems(list);
      }

      Query queryCount = entityManager.createQuery("select count(e.id) FROM Account e where 1=1 " + condition);

      if (dto.getFullname() != null) {
        queryCount.setParameter("name", "%" + dto.getFullname().toLowerCase() + "%");
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
