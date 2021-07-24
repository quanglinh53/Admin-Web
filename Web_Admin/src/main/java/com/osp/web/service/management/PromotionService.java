package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.PromotionDTO;
import org.springframework.http.ResponseEntity;

public interface PromotionService {

  ResponseEntity<PromotionDTO> add(PromotionDTO dto);

  ResponseEntity<PromotionDTO> edit(String id, PromotionDTO dto);

  ResponseEntity<PromotionDTO> get(String id);

  ResponseEntity<?> delete(String id);

  ResponseEntity<PagingResult> page(PromotionDTO dto, PagingResult page);

  PromotionDTO getDTOById(String id);
}
