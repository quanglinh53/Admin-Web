package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.TransactionFormDTO;
import org.springframework.http.ResponseEntity;

public interface TransactionFormService {

  ResponseEntity<TransactionFormDTO> add(TransactionFormDTO dto);

  ResponseEntity<TransactionFormDTO> edit(String id, TransactionFormDTO dto);

  ResponseEntity<TransactionFormDTO> get(String id);

  ResponseEntity<?> delete(String id);

  ResponseEntity<PagingResult> page(TransactionFormDTO dto, PagingResult page);

  TransactionFormDTO getDTOById(String id);
}
