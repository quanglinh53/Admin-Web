package com.osp.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CategoryDTO {

  private int id;

  private int rootId = 0;

  private String name;

  private CategoryDTO root;

}
