package com.jlu.user.web;


import com.jlu.common.web.BaseController;
import com.jlu.user.model.User;
import com.jlu.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2018/4/19.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    IUserService userService;


    @RequestMapping(value = "", method = RequestMethod.POST)
    public String login(User user) {
        userService.saveOrUpdateUser(user);
        return "forward:/user/login";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(User user) {
        userService.saveOrUpdateUser(user);
        return "";
    }

    @RequestMapping(value = "/query", method = RequestMethod.GET)
    @ResponseBody
    public Boolean query(String username) {
        User user = userService.getUserByName(username);
        if (user == null) {
            return false;
        } else {
            return true;
        }
    }

    @RequestMapping(value = "/{username}", method = RequestMethod.GET)
    public ModelAndView all(@PathVariable String username) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.getUserByName(username);
        modelAndView.addObject("user", user);
        System.out.println(user);
        modelAndView.setViewName("user/one");
        return modelAndView;
    }

}
