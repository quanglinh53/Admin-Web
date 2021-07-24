package com.osp.web.dao.management;

import com.osp.common.PagingResult;
import com.osp.dto.TransactionHistoryDTO;
import com.osp.model.admin.TransactionHistory;
import java.util.Optional;

public interface TransactionHistoryDao {

  TransactionHistory add(TransactionHistory entity);

  TransactionHistory edit(TransactionHistory entity);

  TransactionHistory get(String id);

  Optional<PagingResult> page(PagingResult page, TransactionHistoryDTO username);

  void del(String id);

}
