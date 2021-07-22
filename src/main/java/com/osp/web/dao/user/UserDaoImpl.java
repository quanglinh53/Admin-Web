package com.osp.web.dao.user;

import com.osp.common.PagingResult;
import com.osp.model.admin.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;

/**
 * Created by Admin on 12/26/2017.
 */
@Repository
//chỗ này phải sửa lại EntityManager mặc định // tất cả các class ah nhé
@Transactional(value = "transactionManager")
public class UserDaoImpl implements UserDao {

    private Logger logger= LogManager.getLogger(UserDaoImpl.class);
    @PersistenceContext(unitName = "appAdmin")
    @Qualifier(value = "transactionManager")
    private EntityManager entityManager;

//    @Qualifier("sfAccounting")
//    @Autowired
//    private SessionFactory sessionFactory;


    @Override
    public Optional<PagingResult> pageUser(String username, PagingResult page) {
        int offset=0;
        if(page.getPageNumber()>0) offset=(page.getPageNumber()-1)*page.getNumberPerPage();
        Long count=(Long)entityManager.createQuery("select count(u.id) from User u where u.username like :username").setParameter("username","%"+username+"%").getSingleResult();
        List<User> list=entityManager.createQuery("select u from User u where u.username like :username",User.class).setParameter("username","%"+username+"%")
                .setFirstResult(offset).setMaxResults(page.getNumberPerPage()).getResultList();
        if(list!=null && count>0){
            page.setItems(list);
            page.setRowCount(count.longValue());
        }
        entityManager.close();
        return Optional.of(page);
    }

    @Override
    public Optional<Boolean> addUser(User item) {
        try {
            entityManager.persist(item);
            entityManager.flush();
            return Optional.of(Boolean.valueOf(true));
        } catch (Exception e) {
            logger.error("Have error in UserDaoImpl.addUser: "+e.getMessage());
            return Optional.of(Boolean.valueOf(false));
        }
    }

    @Override
    public Optional<User> get(Long id) {
        User user=new User();
        try {
            user=entityManager.find(User.class,id);
            return Optional.ofNullable(user);
        } catch (Exception e) {
            logger.error("Have error in UserDaoImpl.get: "+e.getMessage());
            return Optional.ofNullable(user);
        }
        finally {
            entityManager.close();
        }

    }

    @Override
    public Optional<Boolean> editUser(User item) {
        try {
            entityManager.merge(item);
            entityManager.flush();
            return Optional.ofNullable(true);
        } catch (Exception e) {
            logger.error("Have error in UserDaoImpl.editUser: "+e.getMessage());
            return Optional.ofNullable(false);
        }
    }

    @Override
    public Optional<Boolean> deleteUser(Long id) {
        try {
            Query query =entityManager.createQuery("delete from User u where u.id=:id").setParameter("id",id);
            query.executeUpdate();
            return Optional.ofNullable(true);
        } catch (Exception e) {
            logger.error("Have error in UserDaoImpl.deleteUser: "+e.getMessage());
            return Optional.ofNullable(false);
        }
    }

    @Override
    public Optional<User> getByUsername(String username) {
        User user=entityManager.createQuery("SELECT u from User u where u.username=:username",User.class).setParameter("username",username).getSingleResult();
        entityManager.close();
        return Optional.ofNullable(user);

    }

    @Override
    public Optional<Boolean> changeMyPass(String passNew, Long id) {
        Query query=entityManager.createQuery("update User u set u.password=:pass where u.id=:id").setParameter("pass",passNew).setParameter("id",id);
        query.executeUpdate();
        return Optional.of(true);
    }
}
