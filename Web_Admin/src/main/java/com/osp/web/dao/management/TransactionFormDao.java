package com.osp.web.dao.management;

import com.osp.common.PagingResult;
import com.osp.dto.TransactionFormDTO;
import com.osp.model.admin.TransactionForm;
import java.util.Optional;

public interface TransactionFormDao {

  TransactionForm add(TransactionForm entity);

  void del(String id);

  TransactionForm edit(TransactionForm entity);

  TransactionForm get(String id);

  Optional<PagingResult> page(PagingResult page, TransactionFormDTO username);

}
