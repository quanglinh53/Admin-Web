package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.AccountDTO;
import com.osp.dto.PayCardDTO;
import org.springframework.http.ResponseEntity;

public interface AccountService {

  ResponseEntity<AccountDTO> add(AccountDTO dto);

  ResponseEntity<PagingResult> page(AccountDTO dto, PagingResult page);

  ResponseEntity<AccountDTO> addPayCard(String id, PayCardDTO dto);

  ResponseEntity<AccountDTO> lockAccount(String id);

  ResponseEntity<AccountDTO> unlockAccount(String id);

  AccountDTO getDTOById(String id);
}
