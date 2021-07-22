package com.osp.web.service.management;

import com.osp.dto.PayCardDTO;
import com.osp.model.admin.PayCard;
import com.osp.web.dao.management.PayCardDao;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class PayCardServiceImpl implements PayCardService {

  @Autowired
  PayCardDao payCardDao;

  @Autowired
  BCryptPasswordEncoder encoder;

  ModelMapper modelMapper = new ModelMapper();

  private void configModelMapper(ModelMapper modelMapper) {

    modelMapper.addMappings(new PropertyMap<PayCardDTO, PayCard>() {
      @Override
      protected void configure() {

      }
    });
  }

  private PayCardDTO convertToDto(PayCard entity) {
    PayCardDTO dto = modelMapper.map(entity, PayCardDTO.class);
    return dto;
  }


  private PayCard convertToEntity(PayCardDTO dto) {
    configModelMapper(modelMapper);
    PayCard entity = modelMapper.map(dto, PayCard.class);
    return entity;
  }


  @Override
  public ResponseEntity<PayCardDTO> add(PayCardDTO dto) {

    PayCard payCard = payCardDao.add(convertToEntity(dto));

    return new ResponseEntity<>(convertToDto(payCard), HttpStatus.OK);
  }

  @Override
  public PayCardDTO getDtoById(String id) {
    return convertToDto(payCardDao.get(id));
  }

  @Override
  public PayCardDTO add2(PayCardDTO dto) {
    PayCard payCard = payCardDao.add(convertToEntity(dto));
    return convertToDto(payCard);
  }


  private List<PayCardDTO> convertToListDto(List<PayCard> listEntity) {
    List<PayCardDTO> dtoList = new ArrayList<>();
    listEntity.stream().forEach(e -> {
      dtoList.add(convertToDto(e));
    });
    return dtoList;
  }
}
