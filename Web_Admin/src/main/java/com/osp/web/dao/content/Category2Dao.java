package com.osp.web.dao.content;

import com.osp.common.PagingResult;
import com.osp.model.Category2;

import java.util.List;

/**
 * Created by Admin on 2/26/2018.
 */
public interface Category2Dao {
    PagingResult page(PagingResult page, String name);
    List<Category2> list();
    List<Category2> listByRoot();
    Category2 ltsByUrl(String url);
    List<Category2> ltsByIdRoot(Integer id,Integer status);
    List<Category2> ltsByOn();
    Category2 get(Integer id);
    Integer getMaxValue();
    Boolean add(Category2 item);
    Boolean edit(Category2 item);
    Boolean delete(Integer id);

}
