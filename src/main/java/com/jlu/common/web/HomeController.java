package com.jlu.common.web;

import com.jlu.category.bean.CategoryBean;
import com.jlu.category.service.ICategoryService;
import com.jlu.common.interceptor.UserLoginHelper;
import com.jlu.common.permission.annotations.PermissionPass;
import com.jlu.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */

@Controller
public class HomeController {

    @Autowired
    private ICategoryService categoryService;

    @PermissionPass
    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        return "login";
    }


    @RequestMapping({"/", ""})
    public String home() {
        return "main";
    }

    @RequestMapping("/exit")
    public String exit(HttpServletRequest request) {
        request.getSession().removeAttribute(User.CURRENT_USER_NAME);
        return "login";
    }

    @PermissionPass
    @RequestMapping("/public/{userid}")
    public String userPublic(Model model, @PathVariable Integer userid) {
        List<CategoryBean> categories = categoryService.getCategoryBeanList(userid);
        model.addAttribute("categories", categories);
        return "public";
    }

}
