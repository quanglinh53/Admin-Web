package com.osp.web.service.management;

import com.osp.dto.PayCardDTO;
import java.util.UUID;
import org.springframework.http.ResponseEntity;

public interface PayCardService {

  ResponseEntity<PayCardDTO> add(PayCardDTO dto);

  PayCardDTO getDtoById(String id);

  PayCardDTO add2(PayCardDTO dto);

}
