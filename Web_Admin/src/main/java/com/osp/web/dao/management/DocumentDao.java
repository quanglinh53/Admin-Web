package com.osp.web.dao.management;

import com.osp.common.PagingResult;
import com.osp.dto.DocumentDTO;
import com.osp.model.admin.Document;
import java.util.Optional;

/**
 * Created by Admin on 2/26/2018.
 */
public interface DocumentDao {

   Document add(Document entity);

   void del(String id);

   Document edit(Document entity);

   Document get(String id);

   Optional<PagingResult> page(PagingResult page, DocumentDTO dto);
}
