package com.osp.web.dao.management;

import com.osp.common.PagingResult;
import com.osp.dto.CategoryDTO;
import com.osp.model.admin.Category;
import java.util.Optional;

public interface CategoryDao {

  Category add(Category entity);

  void del(int id);

  Category edit(Category entity);

  Category get(int id);

  Optional<PagingResult> page(PagingResult page, CategoryDTO dto);
}
