package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.TransactionHistoryDTO;
import org.springframework.http.ResponseEntity;

public interface TransactionHistoryService {

  ResponseEntity<TransactionHistoryDTO> add( TransactionHistoryDTO dto);

  ResponseEntity<TransactionHistoryDTO> get(String id);

  ResponseEntity<PagingResult> page( TransactionHistoryDTO dto, PagingResult page);


}
