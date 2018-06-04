package com.jlu.article.web;

import com.jlu.common.interceptor.UserLoginHelper;
import com.jlu.common.permission.annotations.PermissionPass;
import com.jlu.common.web.BaseController;
import com.jlu.article.model.Article;
import com.jlu.article.service.IArticleService;
import com.jlu.common.web.ResponseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController {

    @Autowired
    private IArticleService articleService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Article article, MultipartFile image, HttpServletRequest request) throws IOException {
        articleService.saveOrUpdate(article, image, request);
        return "redirect:all";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Article article, MultipartFile image, HttpServletRequest request) throws IOException {
        articleService.saveOrUpdate(article, image, request);
        return "redirect:all";
    }

    @RequestMapping(value = "/update/{articleId}",method = RequestMethod.GET)
    public ModelAndView updateView(@PathVariable Long articleId) {
        ModelAndView mav = new ModelAndView();
        Article article = articleService.get(articleId);
        mav.addObject("article",article);
        mav.setViewName("/article/update");
        return mav;
    }

    @PermissionPass
    @RequestMapping(value = "/{articleId}")
    public ModelAndView one(@PathVariable Long articleId) {
        ModelAndView mav = new ModelAndView();
        Article article = articleService.get(articleId);
        mav.addObject("article",article);
        mav.setViewName("/article/one");
        return mav;
    }

    @RequestMapping(value = "/delete/{articleId}.json",method = RequestMethod.GET)
    @ResponseBody
    public ResponseBean delete(@PathVariable Long articleId) {
        articleService.delete(articleId);
        return ResponseBean.TRUE;
    }

    @RequestMapping("/all")
    public ModelAndView all() {
        ModelAndView modelAndView = new ModelAndView();
        Integer userId = UserLoginHelper.getLoginUser().getId();
        List<Article> articles = articleService.getByUserId(userId);
        modelAndView.addObject("articles",articles);
        modelAndView.setViewName("article/all");
        return modelAndView;
    }
}
