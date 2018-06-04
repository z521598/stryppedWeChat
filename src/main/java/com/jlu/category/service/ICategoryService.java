package com.jlu.category.service;

import com.jlu.category.bean.CategoryBean;

import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
public interface ICategoryService {
    void saveOrUpdate(CategoryBean[] categories);

    List<CategoryBean> getCategoryBeanList(Integer userId);
}
