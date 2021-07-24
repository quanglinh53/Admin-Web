package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.CategoryDTO;
import org.springframework.http.ResponseEntity;

public interface CategoryService {

  ResponseEntity<CategoryDTO> add(CategoryDTO dto);

  ResponseEntity<CategoryDTO> edit(int id, CategoryDTO dto);

  ResponseEntity<CategoryDTO> get(int id);

  ResponseEntity<?> delete(int id);

  ResponseEntity<PagingResult> page(CategoryDTO dto, PagingResult page);

  CategoryDTO getDTOById(int id);
}
