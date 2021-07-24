package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.DocumentDTO;
import com.osp.dto.PayCardDTO;
import com.osp.dto.DocumentDTO;
import org.springframework.http.ResponseEntity;

public interface DocumentService {

  ResponseEntity<DocumentDTO> add( DocumentDTO dto);

  ResponseEntity<DocumentDTO> edit(String id,  DocumentDTO dto);

  ResponseEntity<DocumentDTO> get(String id);

  ResponseEntity<?> delete(String id);

  ResponseEntity<PagingResult> page( DocumentDTO dto, PagingResult page);

  DocumentDTO getDTOById(String id);

  ResponseEntity<?> changeStatus(String id, Integer status);
}
