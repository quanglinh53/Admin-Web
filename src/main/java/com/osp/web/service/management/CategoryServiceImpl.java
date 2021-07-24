package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.CategoryDTO;
import com.osp.dto.CategoryDTO;
import com.osp.model.Response;
import com.osp.model.admin.Category;
import com.osp.model.admin.Category;
import com.osp.model.admin.User;
import com.osp.web.dao.management.CategoryDao;
import java.util.ArrayList;
import java.util.List;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends BaseService implements CategoryService {

  @Autowired
  CategoryDao categoryDao;

  private ModelMapper modelMapper;

  private static void configModelMapper(ModelMapper modelMapper) {

    modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
    modelMapper.addMappings(new PropertyMap<CategoryDTO, Category>() {
      @Override
      protected void configure() {
        skip(destination.getRoot());
     
      }
    });
  }

  @Override
  public ResponseEntity<CategoryDTO> add(CategoryDTO dto) {

    Category Category = categoryDao.add(convertToEntity(dto));

    return new ResponseEntity<>(convertToDto(Category), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<CategoryDTO> edit(int id, CategoryDTO dto) {
    User user = getCurrentUser();

    CategoryDTO oldDTO = getDTOById(id);
    oldDTO.setName(dto.getName());
    oldDTO.setRootId(dto.getRootId());

    Category Category = categoryDao.edit(convertToEntity(oldDTO));

    return new ResponseEntity<>(convertToDto(Category), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<CategoryDTO> get(int id) {
    Category Category = categoryDao.get(id);
    return new ResponseEntity<>(convertToDto(Category), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<?> delete(int id) {
    try {
      categoryDao.del(id);
      return new ResponseEntity<>(new Response("Xóa thành công"), HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<>(new Response("Xóa thất bại"), HttpStatus.OK);
    }
  }

  @Override
  public ResponseEntity<PagingResult> page(CategoryDTO dto, PagingResult page) {
    PagingResult pageResult = categoryDao.page(page, dto).orElse(null);
    List<CategoryDTO> listDto;
    if (pageResult != null) {
      listDto = convertToListDto((List<Category>) pageResult.getItems());
      pageResult.setItems(listDto);
    }
    return new ResponseEntity<>(page, HttpStatus.OK);
  }

  @Override
  public CategoryDTO getDTOById(int id) {
    Category Category = categoryDao.get(id);
    if (Category != null) {
      return convertToDto(Category);
    } else {
      return null;
    }
  }

  private CategoryDTO convertToDto(Category entity) {
    modelMapper = new ModelMapper();
    configModelMapper(modelMapper);
    CategoryDTO dto = modelMapper.map(entity, CategoryDTO.class);
    dto.setRoot(getDTOById(entity.getRootId()));
    return dto;
  }


  private Category convertToEntity(CategoryDTO dto) {
    modelMapper = new ModelMapper();
    configModelMapper(modelMapper);
    Category entity = modelMapper.map(dto, Category.class);
    return entity;
  }

  private List<CategoryDTO> convertToListDto(List<Category> listEntity) {
    List<CategoryDTO> dtoList = new ArrayList<>();
    listEntity.stream().forEach(e -> {
      dtoList.add(convertToDto(e));
    });
    return dtoList;
  }
}
