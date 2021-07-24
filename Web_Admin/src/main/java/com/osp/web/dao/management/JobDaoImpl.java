package com.osp.web.dao.management;


import com.osp.common.PagingResult;
import com.osp.dto.JobDTO;
import com.osp.model.admin.Job;
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
public class JobDaoImpl implements JobDao {

  private org.apache.logging.log4j.Logger logger = LogManager.getLogger(JobDaoImpl.class);
  @PersistenceContext(unitName = "appAdmin")
  @Qualifier(value = "transactionManager")
  private EntityManager entityManager;

  @Override
  public Job add(Job entity) {
    entityManager.persist(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public void del(String id) {
    Job Job = entityManager.find(Job.class, id);
    entityManager.remove(Job);
  }

  @Override
  public Job edit(Job entity) {
    entityManager.merge(entity);
    entityManager.flush();
    return entity;
  }

  @Override
  public Job get(String id) {
    Job Job = entityManager.find(Job.class, id);
    return Job;
  }

  @Override
  public Optional<PagingResult> page(PagingResult page, JobDTO dto) {
    User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    int offset = 0;
    if (page.getPageNumber() > 0) {
      offset = (page.getPageNumber() - 1) * page.getNumberPerPage();
    }
    String condition = "";

    try {

      if (!StringUtils.isEmpty(dto.getEmployerName())) {
        condition += " AND LOWER (e.fullname) LIKE :employerName ";
      }

      if (!StringUtils.isEmpty(dto.getTitle())) {
        condition += " AND LOWER (a.title) LIKE :title ";
      }

      if (!StringUtils.isEmpty(dto.getTuNgay())) {
        condition += " AND date_format(a.duration,'%Y-%m-%d') >= :tuNgay ";
      }

      if (!StringUtils.isEmpty(dto.getDenNgay())) {
        condition += " AND date_format(a.duration,'%Y-%m-%d') <= :denNgay ";
      }

      Query query = entityManager
          .createQuery("select a from Job a "
              + " left join a.employer e "
              + " where 1=1 " + condition, Job.class);

      if (!StringUtils.isEmpty(dto.getEmployerName())) {
        query.setParameter("employerName", "%" + dto.getEmployerName().toLowerCase() + "%");
      }

      if (!StringUtils.isEmpty(dto.getTitle() )) {
        query.setParameter("title", "%" + dto.getTitle().toLowerCase() + "%");
      }

      if (!StringUtils.isEmpty(dto.getTuNgay())) {
        query.setParameter("tuNgay", DateTimeUtils.converDate(dto.getTuNgay()));
      }

      if (!StringUtils.isEmpty(dto.getDenNgay())) {
        query.setParameter("denNgay", DateTimeUtils.converDate(dto.getDenNgay()));
      }

      List<Job> list = query.setFirstResult(offset).setMaxResults(page.getNumberPerPage())
          .getResultList();
      if (list != null && list.size() > 0) {
        page.setItems(list);
      }

      Query queryCount = entityManager
          .createQuery("select count(a.id) FROM Job a"
              + " left join a.employer e "
              + "  where 1=1 " + condition);

      if (!StringUtils.isEmpty(dto.getEmployerName() )) {
        queryCount.setParameter("employerName", "%" + dto.getEmployerName().toLowerCase() + "%");
      }

      if (!StringUtils.isEmpty(dto.getTitle() )) {
        queryCount.setParameter("title", "%" + dto.getTitle().toLowerCase() + "%");
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
