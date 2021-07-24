package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.TransactionHistoryDTO;
import com.osp.model.admin.TransactionHistory;
import com.osp.web.dao.management.TransactionHistoryDao;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class TransactionHistoryServiceImpl extends BaseService implements
    TransactionHistoryService {

  @Autowired
  TransactionHistoryDao TransactionHistoryDao;

  @Autowired
  AccountService accountService;

  @Autowired
  TransactionFormService transactionFormService;

  private ModelMapper modelMapper;

  private static void configModelMapper(ModelMapper modelMapper) {

    modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
    modelMapper.addMappings(new PropertyMap<TransactionHistoryDTO, TransactionHistory>() {
      @Override
      protected void configure() {
        skip(destination.getCustomer());
        skip(destination.getSeller());
        skip(destination.getTransactionForm());
      }
    });
  }

  @Override
  public ResponseEntity<TransactionHistoryDTO> add(TransactionHistoryDTO dto) {
    dto.setTransactionDate(new Date());
    TransactionHistory transactionHistory = TransactionHistoryDao.add(convertToEntity(dto));

    return new ResponseEntity<>(convertToDto(transactionHistory), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<TransactionHistoryDTO> get(String id) {
    TransactionHistory transactionHistory = TransactionHistoryDao.get(id);
    return new ResponseEntity<>(convertToDto(transactionHistory), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<PagingResult> page(TransactionHistoryDTO dto, PagingResult page) {
    PagingResult pageResult = TransactionHistoryDao.page(page, dto).orElse(null);
    List<TransactionHistoryDTO> listDto;
    if (pageResult != null) {
      listDto = convertToListDto((List<TransactionHistory>) pageResult.getItems());
      pageResult.setItems(listDto);
    }
    return new ResponseEntity<>(page, HttpStatus.OK);
  }

  private TransactionHistoryDTO convertToDto(TransactionHistory entity) {
    modelMapper = new ModelMapper();
    configModelMapper(modelMapper);
    TransactionHistoryDTO dto = modelMapper.map(entity, TransactionHistoryDTO.class);
    if (entity.getCustomerId() != null) {
      dto.setCustomer(accountService.getDTOById(entity.getCustomerId()));
    }
    if (entity.getSeller() != null) {
      dto.setSeller(accountService.getDTOById(entity.getSellerId()));
    }

    if (entity.getTransactionFormId() != null) {
      dto.setTransactionForm(transactionFormService.getDTOById(entity.getTransactionFormId()));
    }
    return dto;
  }


  private TransactionHistory convertToEntity(TransactionHistoryDTO dto) {
    modelMapper = new ModelMapper();
    configModelMapper(modelMapper);
    TransactionHistory entity = modelMapper.map(dto, TransactionHistory.class);
    return entity;
  }

  private List<TransactionHistoryDTO> convertToListDto(List<TransactionHistory> listEntity) {
    List<TransactionHistoryDTO> dtoList = new ArrayList<>();
    listEntity.stream().forEach(e -> {
      dtoList.add(convertToDto(e));
    });
    return dtoList;
  }
}
