package com.osp.web.dao.management;

import com.osp.common.PagingResult;
import com.osp.dto.PromotionDTO;
import com.osp.model.admin.Promotion;
import java.util.Optional;

public interface PromotionDao {

  Promotion add(Promotion entity);

  void del(String id);

  Promotion edit(Promotion entity);

  Promotion get(String id);

  Optional<PagingResult> page(PagingResult page, PromotionDTO dto);

}
