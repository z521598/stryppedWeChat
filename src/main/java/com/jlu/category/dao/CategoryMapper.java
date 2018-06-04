package com.jlu.category.dao;

import com.jlu.category.model.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    void deleteByUserId(@Param("userId") Integer userId);

    List<Category> selectByUserId(@Param("userId")Integer userId);
}