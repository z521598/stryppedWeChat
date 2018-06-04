package com.jlu.user.web;


import com.jlu.common.interceptor.UserLoginHelper;
import com.jlu.common.permission.annotations.PermissionPass;
import com.jlu.common.web.BaseController;
import com.jlu.common.web.ResponseBean;
import com.jlu.user.model.User;
import com.jlu.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2018/4/19.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    IUserService userService;

    @PermissionPass
    @RequestMapping(value = "", method = RequestMethod.POST)
    public String login(User user) {
        userService.saveOrUpdateUser(user);
        return "redirect:/user/login";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView update(User user) {
        userService.saveOrUpdateUser(user);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", userService.getUserByName(UserLoginHelper.getLoginUserName()));
        System.out.println(user);
        modelAndView.setViewName("user/one");
        return modelAndView;
    }

    @PermissionPass
    @RequestMapping(value = "/query.json", method = RequestMethod.GET)
    @ResponseBody
    public ResponseBean query(String username) {
        User user = userService.getUserByName(username);
        if (user == null) {
            return ResponseBean.TRUE;
        } else {
            return ResponseBean.fail("");
        }
    }

    @RequestMapping(value = "/currentUser", method = RequestMethod.GET)
    public ModelAndView all() {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.getUserByName(UserLoginHelper.getLoginUserName());
        modelAndView.addObject("user", user);
        System.out.println(user);
        modelAndView.setViewName("user/one");
        return modelAndView;
    }

}
