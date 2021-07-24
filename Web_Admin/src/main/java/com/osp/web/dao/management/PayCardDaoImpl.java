package com.osp.web.dao.management;


import com.osp.model.admin.PayCard;
import java.util.UUID;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional(value = "transactionManager")
public class PayCardDaoImpl implements PayCardDao {

  private org.apache.logging.log4j.Logger logger = LogManager.getLogger(PayCardDaoImpl.class);
  @PersistenceContext(unitName = "appAdmin")
  @Qualifier(value = "transactionManager")
  private EntityManager entityManager;

  @Override
  public PayCard add(PayCard entity) {
    entityManager.persist(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public void del(String id) {
    PayCard payCard = entityManager.find(PayCard.class, id);
    entityManager.remove(payCard);
  }

  @Override
  public PayCard edit(PayCard entity) {
    entityManager.merge(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public PayCard get(String id) {
    PayCard payCard = entityManager.find(PayCard.class, id);
    return payCard;
  }

}
