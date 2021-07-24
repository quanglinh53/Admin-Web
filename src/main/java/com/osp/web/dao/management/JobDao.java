package com.osp.web.dao.management;

import com.osp.common.PagingResult;
import com.osp.dto.JobDTO;
import com.osp.model.admin.Job;
import java.util.Optional;

/**
 * Created by Admin on 2/26/2018.
 */
public interface JobDao {

   Job add(Job entity);

   void del(String id);

   Job edit(Job entity);

   Job get(String id);

   Optional<PagingResult> page(PagingResult page, JobDTO dto);
}
