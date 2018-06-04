package com.jlu.user.dao;

import com.jlu.user.model.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    // 传
    User selectByUsernameAndPwd(@Param("username") String username, @Param("password") String password);

    User selectByUsername(String username);
}