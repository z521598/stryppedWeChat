package com.jlu.category.bean;

import com.jlu.category.model.Category;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
public class CategoryBean extends Category{
    List<Category> childCategory = new LinkedList<>();

    public List<Category> getChildCategory() {
        return childCategory;
    }

    public CategoryBean setChildCategory(List<Category> childCategory) {
        this.childCategory = childCategory;
        return this;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("CategoryBean{");
        sb.append(super.toString());
        sb.append("childCategory=").append(childCategory);
        sb.append('}');
        return sb.toString();
    }
}
