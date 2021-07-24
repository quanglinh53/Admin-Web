package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.PromotionDTO;
import com.osp.model.Response;
import com.osp.model.admin.Promotion;
import com.osp.model.admin.User;
import com.osp.web.dao.management.PromotionDao;
import java.util.ArrayList;
import java.util.List;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class PromotionServiceImpl extends BaseService implements PromotionService {

  @Autowired
  PromotionDao transactionFormDao;

  private ModelMapper modelMapper;

  @Override
  public ResponseEntity<PromotionDTO> add(PromotionDTO dto) {
    User user = getCurrentUser();
    dto.setCreatedBy(user.getFullName());
    dto.setUpdatedBy(user.getFullName());
    Promotion transactionForm = transactionFormDao.add(convertToEntity(dto));

    return new ResponseEntity<>(convertToDto(transactionForm), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<PromotionDTO> edit(String id, PromotionDTO dto) {
    User user = getCurrentUser();

    PromotionDTO oldDTO = convertToDto(transactionFormDao.get(id));
    oldDTO.setDescription(dto.getDescription());
    oldDTO.setDuration(dto.getDuration());
    oldDTO.setTitle(dto.getTitle());
    oldDTO.setType(dto.getType());
    oldDTO.setValue(dto.getValue());
    oldDTO.setUpdatedBy(user.getFullName());

    Promotion transactionForm = transactionFormDao.edit(convertToEntity(oldDTO));

    return new ResponseEntity<>(convertToDto(transactionForm), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<PromotionDTO> get(String id) {
    Promotion transactionForm = transactionFormDao.get(id);
    return new ResponseEntity<>(convertToDto(transactionForm), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<?> delete(String id) {
    try {
      transactionFormDao.del(id);
      return new ResponseEntity<>(new Response("Xóa thành công"), HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<>(new Response("Xóa thất bại"), HttpStatus.OK);
    }
  }

  @Override
  public ResponseEntity<PagingResult> page(PromotionDTO dto, PagingResult page) {
    PagingResult pageResult = transactionFormDao.page(page, dto).orElse(null);
    List<PromotionDTO> listDto;
    if (pageResult != null) {
      listDto = convertToListDto((List<Promotion>) pageResult.getItems());
      pageResult.setItems(listDto);
    }
    return new ResponseEntity<>(page, HttpStatus.OK);
  }

  @Override
  public PromotionDTO getDTOById(String id) {
    Promotion transactionForm = transactionFormDao.get(id);
    if (transactionForm != null) {
      return convertToDto(transactionForm);
    } else {
      return null;
    }
  }

  private PromotionDTO convertToDto(Promotion entity) {
    modelMapper = new ModelMapper();
    PromotionDTO dto = modelMapper.map(entity, PromotionDTO.class);

    return dto;
  }


  private Promotion convertToEntity(PromotionDTO dto) {
    modelMapper = new ModelMapper();
    Promotion entity = modelMapper.map(dto, Promotion.class);
    return entity;
  }

  private List<PromotionDTO> convertToListDto(List<Promotion> listEntity) {
    List<PromotionDTO> dtoList = new ArrayList<>();
    listEntity.stream().forEach(e -> {
      dtoList.add(convertToDto(e));
    });
    return dtoList;
  }
}
