package com.jlu.category.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2018/6/4.
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

    @RequestMapping("/currentUser")
    public ModelAndView one(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("category/one");
        return mav;
    }
}
