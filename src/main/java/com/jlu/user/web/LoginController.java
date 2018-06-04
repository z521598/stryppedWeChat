package com.jlu.user.web;


import com.jlu.common.permission.annotations.PermissionPass;
import com.jlu.common.web.BaseController;
import com.jlu.user.model.User;
import com.jlu.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2018/4/19.
 */

@PermissionPass
@Controller
@RequestMapping("/user")
public class LoginController extends BaseController {
    @Autowired
    IUserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpServletRequest request) {
        User activeUser = userService.getUserByNameAndPwd(user.getUsername(), user.getPassword());
        if (activeUser == null) {
            model.addAttribute("wrongMsg", "用户名或者密码错误");
            return "login";
        }
        request.getSession().setAttribute(User.CURRENT_USER_NAME, activeUser);
        return "redirect:/";

    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "register";
    }

}
