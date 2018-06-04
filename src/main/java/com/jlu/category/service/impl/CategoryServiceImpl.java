package com.jlu.category.service.impl;

import com.jlu.category.dao.CategoryMapper;
import com.jlu.category.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/6/4.
 */
@Service
public class CategoryServiceImpl implements ICategoryService{

    @Autowired
    private CategoryMapper categoryMapper;

    

}
