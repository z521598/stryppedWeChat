package com.jlu.common.interceptor;


import com.jlu.user.model.User;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by langshiquan on 18/1/29.
 */
@Component
public class UserLoginHelper {

    private static final ThreadLocal<User> USER_TL = new ThreadLocal<>();

    /**
     * 在用户验证拦截器中设置session中用户到ThreadLocal中
     *
     * @param user
     */
    public static void register(User user) {
        if (user == null) {
            return;
        }
        USER_TL.set(user);
    }

    /**
     * 获取当前session中的登录用户
     */
    private static User getUser() {
        return USER_TL.get();
    }

    /**
     * session结束前，用来清除Threadlocal中用户，节约空间
     */
    public static void destory() {
        USER_TL.set(null);
    }

    public static User getLoginUser(HttpServletRequest request) {

        HttpSession session = request.getSession();
        Object user = session.getAttribute(User.CURRENT_USER_NAME);

        if (user instanceof com.jlu.user.model.User) {
            return (com.jlu.user.model.User) user;
        }
        return null;
    }

    public static String getLoginUserName(HttpServletRequest request) {
        User User = getLoginUser(request);
        return User == null ? "未知用户" : User.getUsername();
    }

    public static String getLoginUserName() {
        if (getUser() == null) {
            return "未知用户";
        }
        return getUser().getUsername();
    }

    public static User getLoginUser() {
        return getUser();
    }
}
