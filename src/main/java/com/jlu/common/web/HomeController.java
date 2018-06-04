package com.jlu.common.web;

import com.jlu.common.interceptor.UserLoginHelper;
import com.jlu.common.permission.annotations.PermissionPass;
import com.jlu.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2018/6/4.
 */

@Controller
public class HomeController {

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

}
