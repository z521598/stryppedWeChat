package com.jlu.article.service.impl;

import com.jlu.article.dao.ArticleMapper;
import com.jlu.article.model.Article;
import com.jlu.article.service.IArticleService;
import com.jlu.common.interceptor.UserLoginHelper;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2018/6/4.
 */
@Service
public class ArticleServiceImpl implements IArticleService {

    @Resource
    private ArticleMapper articleMapper;


    @Override
    public void saveOrUpdate(Article article, MultipartFile image, HttpServletRequest request) throws IOException {
        if(article.getId() == null){
            Integer userId = UserLoginHelper.getLoginUser().getId();
            article.setUserid(userId);
        }
        article.setDate(new Date());
        String imagePath = uploadFile(request, image, article);
        if (StringUtils.isNotBlank(imagePath)) {
            article.setImagepath(imagePath);
        }
        if(article.getId() == null){
            articleMapper.insert(article);
        }else {
            articleMapper.updateByPrimaryKeySelective(article);
        }

    }


    private String uploadFile(HttpServletRequest request, MultipartFile conclusionFilePath, Article article) throws IOException {
        String url = request.getSession().getServletContext().getRealPath("resources");
        // 如果没有该路径，自动创建
        File floder = new File(url);
        if (!floder.exists()) {
            floder.mkdir();
        }
        if (conclusionFilePath == null) {
            return null;
        }
        // 原始文件名
        String originalFilename = conclusionFilePath.getOriginalFilename();
        if (StringUtils.isBlank(originalFilename)) {
            return null;
        }
        // 新文件名
        String fileName = UUID.randomUUID()
                + originalFilename.substring(originalFilename
                .lastIndexOf("."));
        // 保存图片
        conclusionFilePath.transferTo(new File(url, fileName));
        return "/resources/" + fileName;

    }


    @Override
    public Article get(Long articleId) {
        return articleMapper.selectByPrimaryKey(articleId);
    }

    @Override
    public void delete(Long articleId) {
        articleMapper.deleteByPrimaryKey(articleId);
    }

    @Override
    public List<Article> getByUserId(Integer userId) {
        return articleMapper.selectByUserId(userId);
    }
}
