package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.DocumentDTO;
import com.osp.dto.DocumentDTO;
import com.osp.model.Response;
import com.osp.model.admin.Document;
import com.osp.model.admin.Category;
import com.osp.model.admin.Document;
import com.osp.model.admin.Document;
import com.osp.model.admin.User;
import com.osp.web.dao.management.DocumentDao;
import java.util.ArrayList;
import java.util.List;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DocumentServiceImpl extends BaseService implements DocumentService {

  @Autowired
  DocumentDao documentDao;

  @Autowired
  AccountService accountService;

  @Autowired
  CategoryService categoryService;

  private ModelMapper modelMapper;

  private static void configModelMapper(ModelMapper modelMapper) {

    modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
    modelMapper.addMappings(new PropertyMap<DocumentDTO, Document>() {
      @Override
      protected void configure() {
        skip(destination.getAccount());
        skip(destination.getCategory());
      }
    });
  }

  @Override
  public ResponseEntity<DocumentDTO> add(DocumentDTO dto) {

    Document document = documentDao.add(convertToEntity(dto));

    return new ResponseEntity<>(convertToDto(document), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<DocumentDTO> edit(String id, DocumentDTO dto) {

    Document entity = documentDao.get(id);

    entity.setImage(dto.getImage());
    entity.setCategoryId(dto.getCategoryId());
    entity.setDescription(dto.getDescription());
    entity.setDocumentFile(dto.getDocumentFile());
    entity.setLink(dto.getLink());
    entity.setPrice(dto.getPrice());
    entity.setTag(dto.getTag());
    entity.setThumbnail(dto.getThumbnail());
    entity.setTitle(dto.getTitle());

    Document Document = documentDao.edit(entity);

    return new ResponseEntity<>(convertToDto(Document), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<DocumentDTO> get(String id) {
    Document document = documentDao.get(id);
    return new ResponseEntity<>(convertToDto(document), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<?> delete(String id) {
    try {
      documentDao.del(id);
      return new ResponseEntity<>(new Response("Xóa thành công"), HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<>(new Response("Xóa thất bại"), HttpStatus.OK);
    }
  }

  @Override
  public ResponseEntity<PagingResult> page(DocumentDTO dto, PagingResult page) {
    PagingResult pageResult = documentDao.page(page, dto).orElse(null);
    List<DocumentDTO> listDto;
    if (pageResult != null) {
      listDto = convertToListDto((List<Document>) pageResult.getItems());
      pageResult.setItems(listDto);
    }
    return new ResponseEntity<>(page, HttpStatus.OK);
  }

  @Override
  public DocumentDTO getDTOById(String id) {
    Document Document = documentDao.get(id);
    if (Document != null) {
      return convertToDto(Document);
    } else {
      return null;
    }
  }

  private DocumentDTO convertToDto(Document entity) {
    modelMapper = new ModelMapper();
    configModelMapper(modelMapper);
    DocumentDTO dto = modelMapper.map(entity, DocumentDTO.class);
    dto.setCategory(categoryService.getDTOById(entity.getCategoryId()));
    dto.setAccount(accountService.getDTOById(entity.getAccountId()));
    return dto;
  }


  private Document convertToEntity(DocumentDTO dto) {
    modelMapper = new ModelMapper();
    configModelMapper(modelMapper);
    Document entity = modelMapper.map(dto, Document.class);
    return entity;
  }

  private List<DocumentDTO> convertToListDto(List<Document> listEntity) {
    List<DocumentDTO> dtoList = new ArrayList<>();
    listEntity.stream().forEach(e -> {
      dtoList.add(convertToDto(e));
    });
    return dtoList;
  }

  @Override
  @Transactional
  public ResponseEntity<?> changeStatus(String id, Integer status) {
    Document document = documentDao.get(id);
    document.setStatus(status);
    return new ResponseEntity<>(convertToDto(documentDao.edit(document)), HttpStatus.OK);
  }

}
