package com.jlu.article.service;

import com.jlu.article.model.Article;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
public interface IArticleService {

    void saveOrUpdate(Article article, MultipartFile image, HttpServletRequest request) throws IOException;

    Article get(Long articleId);

    void delete(Long articleId);

    List<Article> getByUserId(Integer userId);
}
