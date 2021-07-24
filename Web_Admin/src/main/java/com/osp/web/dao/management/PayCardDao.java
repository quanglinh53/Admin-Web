package com.osp.web.dao.management;

import com.osp.model.admin.PayCard;
import java.util.UUID;

/**
 * Created by Admin on 2/26/2018.
 */
public interface PayCardDao {

  PayCard add(PayCard entity);

  void del(String id);

  PayCard edit(PayCard entity);

  PayCard get(String id);

//   Optional<PagingResult> page(PagingResult page, PayCardDto username);
}
