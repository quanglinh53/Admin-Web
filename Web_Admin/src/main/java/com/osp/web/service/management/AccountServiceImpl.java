package com.osp.web.service.management;

import com.osp.common.Constant.ACCOUNT_STATUS;
import com.osp.common.PagingResult;
import com.osp.dto.AccountDTO;
import com.osp.dto.PayCardDTO;
import com.osp.model.admin.Account;
import com.osp.web.dao.management.AccountDao;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {

  @Autowired
  AccountDao accountDao;

  @Autowired
  PayCardService payCardService;

  @Autowired
  BCryptPasswordEncoder encoder;

  private ModelMapper modelMapper;

  private static void configModelMapper(ModelMapper modelMapper) {

    modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
    modelMapper.addMappings(new PropertyMap<AccountDTO, Account>() {
      @Override
      protected void configure() {
        skip(destination.getPassword());
      }
    });
  }

  @Override
  public ResponseEntity<AccountDTO> add(AccountDTO dto) {

    Account account = accountDao.add(convertToEntity(dto));

    return new ResponseEntity<>(convertToDto(account), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<PagingResult> page(AccountDTO dto, PagingResult page) {
    PagingResult pageResult = accountDao.page(page, dto).orElse(null);
    List<AccountDTO> listDto;
    if (pageResult != null) {
      listDto = convertToListDto((List<Account>) pageResult.getItems());
      pageResult.setItems(listDto);
    }
    return new ResponseEntity<>(page, HttpStatus.OK);
  }

  @Override
  public ResponseEntity<AccountDTO> addPayCard(String id, PayCardDTO dto) {
    dto = payCardService.add2(dto);
    Account account = accountDao.get(id);
    if (dto != null) {
      account.setCardId(dto.getId());
      account = accountDao.edit(account);
    }
    return new ResponseEntity<>(convertToDto(account), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<AccountDTO> lockAccount(String id) {
    Account account = accountDao.get(id);
    if (account != null) {
      account.setStatus(ACCOUNT_STATUS.KHOA);
    }
    account = accountDao.edit(account);
    return new ResponseEntity<>(convertToDto(account), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<AccountDTO> unlockAccount(String id) {
    Account account = accountDao.get(id);
    if (account != null) {
      account.setStatus(ACCOUNT_STATUS.HOAT_DONG);
    }
    account = accountDao.edit(account);
    return new ResponseEntity<>(convertToDto(account), HttpStatus.OK);
  }

  @Override
  public AccountDTO getDTOById(String id) {
    Account account = accountDao.get(id);
    if (account != null) {
      return convertToDto(account);
    } else {
      return null;
    }
  }


  private AccountDTO convertToDto(Account entity) {
    modelMapper = new ModelMapper();
    configModelMapper(modelMapper);
    AccountDTO dto = modelMapper.map(entity, AccountDTO.class);

    return dto;
  }


  private Account convertToEntity(AccountDTO dto) {
    modelMapper = new ModelMapper();
    configModelMapper(modelMapper);
    Account entity = modelMapper.map(dto, Account.class);
    entity.setPassword(encoder.encode(dto.getPassword()));
    if (entity.getId() == null) {
      entity.setVipStatus(0);
      entity.setIsCustomer(0);
      entity.setIsSeller(0);
      entity.setStatus(0);
      entity.setTimesToTop(0);
    }
    return entity;
  }

  private List<AccountDTO> convertToListDto(List<Account> listEntity) {
    List<AccountDTO> dtoList = new ArrayList<>();
    listEntity.stream().forEach(e -> {
      dtoList.add(convertToDto(e));
    });
    return dtoList;
  }
}
