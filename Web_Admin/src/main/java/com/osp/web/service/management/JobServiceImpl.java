package com.osp.web.service.management;

import com.osp.common.PagingResult;
import com.osp.dto.JobDTO;
import com.osp.model.Response;
import com.osp.model.admin.Job;
import com.osp.web.dao.management.JobDao;
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
public class JobServiceImpl extends BaseService implements JobService {

  @Autowired
  JobDao jobDao;

  @Autowired
  AccountService accountService;

  @Autowired
  CategoryService categoryService;

  private ModelMapper modelMapper;

  private static void configModelMapper(ModelMapper modelMapper) {

    modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
    modelMapper.addMappings(new PropertyMap<JobDTO, Job>() {
      @Override
      protected void configure() {
        skip(destination.getEmployee());
        skip(destination.getEmployer());
        skip(destination.getCategory());
      }
    });
  }

  @Override
  public ResponseEntity<JobDTO> add(JobDTO dto) {

    Job entity = jobDao.add(convertToEntity(dto));

    return new ResponseEntity<>(convertToDto(entity), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<JobDTO> edit(String id, JobDTO dto) {

    Job entity = jobDao.get(id);

    entity.setImage(dto.getImage());
    entity.setCategoryId(dto.getCategoryId());
    entity.setDescription(dto.getDescription());
    entity.setThumbnail(dto.getThumbnail());
    entity.setTitle(dto.getTitle());
    entity.setOfferFrom(dto.getOfferFrom());
    entity.setOfferTo(dto.getOfferTo());
    entity.setDuration(dto.getDuration());

    Job Job = jobDao.edit(entity);

    return new ResponseEntity<>(convertToDto(Job), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<JobDTO> get(String id) {
    Job entity = jobDao.get(id);
    return new ResponseEntity<>(convertToDto(entity), HttpStatus.OK);
  }

  @Override
  public ResponseEntity<?> delete(String id) {
    try {
      jobDao.del(id);
      return new ResponseEntity<>(new Response("Xóa thành công"), HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<>(new Response("Xóa thất bại"), HttpStatus.OK);
    }
  }

  @Override
  public ResponseEntity<PagingResult> page(JobDTO dto, PagingResult page) {
    PagingResult pageResult = jobDao.page(page, dto).orElse(null);
    List<JobDTO> listDto;
    if (pageResult != null) {
      listDto = convertToListDto((List<Job>) pageResult.getItems());
      pageResult.setItems(listDto);
    }
    return new ResponseEntity<>(page, HttpStatus.OK);
  }

  @Override
  public JobDTO getDTOById(String id) {
    Job entity = jobDao.get(id);
    if (entity != null) {
      return convertToDto(entity);
    } else {
      return null;
    }
  }

  @Override
  @Transactional
  public ResponseEntity<?> changeStatus(String id, Integer status) {
    Job job = jobDao.get(id);
    job.setStatus(status);
    return new ResponseEntity<>(convertToDto(jobDao.edit(job)), HttpStatus.OK);
  }

  private JobDTO convertToDto(Job entity) {
    modelMapper = new ModelMapper();
    configModelMapper(modelMapper);
    JobDTO dto = modelMapper.map(entity, JobDTO.class);
    dto.setCategory(categoryService.getDTOById(entity.getCategoryId()));
    dto.setEmployee(accountService.getDTOById(entity.getEmployeeId()));
    dto.setEmployer(accountService.getDTOById(entity.getEmployerId()));
    return dto;
  }


  private Job convertToEntity(JobDTO dto) {
    modelMapper = new ModelMapper();
    configModelMapper(modelMapper);
    Job entity = modelMapper.map(dto, Job.class);
    return entity;
  }

  private List<JobDTO> convertToListDto(List<Job> listEntity) {
    List<JobDTO> dtoList = new ArrayList<>();
    listEntity.stream().forEach(e -> {
      dtoList.add(convertToDto(e));
    });
    return dtoList;
  }
}
