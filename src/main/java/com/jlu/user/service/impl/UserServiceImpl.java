package com.jlu.user.service.impl;

import com.jlu.user.dao.UserMapper;
import com.jlu.user.model.User;
import com.jlu.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/6/3.
 */
@Service
public class UserServiceImpl implements IUserService{

    @Resource
    private UserMapper userMapper;

    @Override
    public void saveOrUpdateUser(User user) {
        if(user.getId() != null){
            userMapper.updateByPrimaryKeySelective(user);
        }else {
            userMapper.insert(user);
        }
    }

    @Override
    public User getUserByNameAndPwd(String username, String password) {

        return null;
    }



    @Override
    public User getUserByName(String username) {
        return null;
    }

    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public User getUserById(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }
}
