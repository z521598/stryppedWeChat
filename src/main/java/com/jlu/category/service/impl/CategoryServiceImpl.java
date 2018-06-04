package com.jlu.category.service.impl;

import com.jlu.category.bean.CategoryBean;
import com.jlu.category.bean.CategoryType;
import com.jlu.category.dao.CategoryMapper;
import com.jlu.category.model.Category;
import com.jlu.category.service.ICategoryService;
import com.jlu.common.interceptor.UserLoginHelper;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
@Service
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public void saveOrUpdate(CategoryBean[] categories) {
        Integer userId = UserLoginHelper.getLoginUser().getId();
        categoryMapper.deleteByUserId(userId);
        for (CategoryBean categoryBean : categories) {
            if (categoryBean == null) {
                continue;
            }
            Category category = new Category();
            BeanUtils.copyProperties(categoryBean, category);
            category.setPid(0L);
            category.setLevel(1);
            category.setUserid(userId);
            List<Category> childCategoryBeanList = categoryBean.getChildCategory();
            if (CollectionUtils.isEmpty(childCategoryBeanList)) {
                category.setType(CategoryType.ARTICLE.toString());
                categoryMapper.insert(category);
            } else {
                category.setArticleid(0L);
                category.setType(CategoryType.VIEW.toString());
                categoryMapper.insert(category);
                Long categoryId = category.getId();

                for (Category childCategory : childCategoryBeanList) {
                    if (childCategory == null) {
                        continue;
                    }
                    childCategory.setPid(categoryId);
                    childCategory.setLevel(2);
                    childCategory.setUserid(userId);
                    childCategory.setType(CategoryType.ARTICLE.toString());
                    categoryMapper.insert(childCategory);
                }
            }
        }


    }

    @Override
    public List<CategoryBean> getCategoryBeanList(Integer userId) {
        List<CategoryBean> resCategoryBeanList = new LinkedList<>();
        List<Category> categoryList = categoryMapper.selectByUserId(userId);
        if(CollectionUtils.isEmpty(categoryList)){
            return resCategoryBeanList;
        }
        List<Category> oneLevelCategoryList = getOneLevel(categoryList);
        for(Category oneLevelCategory : oneLevelCategoryList){
            CategoryBean categoryBean = new CategoryBean();
            BeanUtils.copyProperties(oneLevelCategory,categoryBean);
            Long pid = oneLevelCategory.getId();
            categoryBean.setChildCategory(getChild(categoryList,pid));
            resCategoryBeanList.add(categoryBean);
        }
        return resCategoryBeanList;
    }

    private List<Category> getOneLevel(List<Category> categories){
        List<Category> oneLevelCategoryList = new LinkedList<>();
        for(Category category : categories){
            if(category.getLevel() == 1){
                oneLevelCategoryList.add(category);
            }
        }
        return oneLevelCategoryList;
    }

    private List<Category> getChild(List<Category> categories,Long pid){
        List<Category> childCategoryList = new LinkedList<>();
        for(Category category : categories){
            if(category.getPid() == pid){
                childCategoryList.add(category);
            }
        }
        return childCategoryList;
    }

}
