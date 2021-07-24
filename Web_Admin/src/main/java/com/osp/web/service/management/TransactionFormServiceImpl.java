package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.TransactionFormDTO;
import com.osp.model.Response;
import com.osp.model.admin.TransactionForm;
import com.osp.model.admin.User;
import com.osp.web.dao.management.TransactionFormDao;
import java.util.ArrayList;
import java.util.List;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class TransactionFormServiceImpl extends BaseService implements TransactionFormService {

  @Autowired
  TransactionFormDao transactionFormDao;

  private ModelMapper modelMapper;

  @Override
  public ResponseEntity<TransactionFormDTO> add(TransactionFormDTO dto) {
    User user = getCurrentUser();
    dto.setCreatedBy(user.getFullName());
    dto.setUpdatedBy(user.getFullName());
    TransactionForm transactionForm = transactionFormDao.add(convertToEntity(dto));

    return new ResponseEntity<>(convertToDto(transactionForm), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<TransactionFormDTO> edit(String id, TransactionFormDTO dto) {
    User user = getCurrentUser();

    TransactionFormDTO oldDTO = convertToDto(transactionFormDao.get(id));
    oldDTO.setUpdatedBy(user.getFullName());
    oldDTO.setTransactionName(dto.getTransactionName());

    TransactionForm transactionForm = transactionFormDao.edit(convertToEntity(oldDTO));

    return new ResponseEntity<>(convertToDto(transactionForm), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<TransactionFormDTO> get(String id) {
    TransactionForm transactionForm = transactionFormDao.get(id);
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
  public ResponseEntity<PagingResult> page(TransactionFormDTO dto, PagingResult page) {
    PagingResult pageResult = transactionFormDao.page(page, dto).orElse(null);
    List<TransactionFormDTO> listDto;
    if (pageResult != null) {
      listDto = convertToListDto((List<TransactionForm>) pageResult.getItems());
      pageResult.setItems(listDto);
    }
    return new ResponseEntity<>(page, HttpStatus.OK);
  }

  @Override
  public TransactionFormDTO getDTOById(String id) {
    TransactionForm transactionForm = transactionFormDao.get(id);
    if (transactionForm != null) {
      return convertToDto(transactionForm);
    } else {
      return null;
    }
  }

  private TransactionFormDTO convertToDto(TransactionForm entity) {
    modelMapper = new ModelMapper();
    TransactionFormDTO dto = modelMapper.map(entity, TransactionFormDTO.class);

    return dto;
  }


  private TransactionForm convertToEntity(TransactionFormDTO dto) {
    modelMapper = new ModelMapper();
    TransactionForm entity = modelMapper.map(dto, TransactionForm.class);
    return entity;
  }

  private List<TransactionFormDTO> convertToListDto(List<TransactionForm> listEntity) {
    List<TransactionFormDTO> dtoList = new ArrayList<>();
    listEntity.stream().forEach(e -> {
      dtoList.add(convertToDto(e));
    });
    return dtoList;
  }
}
