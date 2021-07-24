package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.JobDTO;
import org.springframework.http.ResponseEntity;

public interface JobService {

  ResponseEntity<JobDTO> add( JobDTO dto);

  ResponseEntity<JobDTO> edit(String id,  JobDTO dto);

  ResponseEntity<JobDTO> get(String id);

  ResponseEntity<?> delete(String id);

  ResponseEntity<PagingResult> page( JobDTO dto, PagingResult page);

  JobDTO getDTOById(String id);

  ResponseEntity<?> changeStatus(String id, Integer status);
}
