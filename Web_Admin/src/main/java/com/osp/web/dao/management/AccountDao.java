package com.osp.web.dao.management;

import com.osp.common.PagingResult;
import com.osp.dto.AccountDTO;
import com.osp.model.admin.Account;
import java.util.Optional;

/**
 * Created by Admin on 2/26/2018.
 */
public interface AccountDao {

   Account add(Account entity);

   void del(String id);

   Account edit(Account entity);

   Account get(String id);

   Optional<PagingResult> page(PagingResult page, AccountDTO username);
}
