package com.jlu.category.web;

import com.jlu.category.bean.CategoryBean;
import com.jlu.category.service.ICategoryService;
import com.jlu.common.interceptor.UserLoginHelper;
import com.jlu.common.web.ResponseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private ICategoryService categoryService;


    @RequestMapping("/currentUser")
    public ModelAndView one() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("category/set");
        return mav;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ResponseBean update(@RequestBody CategoryBean[] categories) {
        categoryService.saveOrUpdate(categories);
        return ResponseBean.TRUE;
    }

    @RequestMapping(value = "all.json",method = RequestMethod.GET)
    @ResponseBody
    public List<CategoryBean> all(){
        return categoryService.getCategoryBeanList(UserLoginHelper.getLoginUser().getId());
    }

}
