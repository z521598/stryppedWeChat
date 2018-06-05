package com.jlu.common.permission.service.impl;


import com.jlu.common.permission.annotations.PermissionAdmin;
import com.jlu.common.permission.annotations.PermissionPass;
import com.jlu.common.permission.service.IPermissionService;
import com.jlu.common.utils.CollUtils;
import com.jlu.common.utils.PackageScanUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Created by langshiquan on 18/2/2.
 */
@Service
public class PermissionServiceImpl implements IPermissionService {

    private final Logger logger = LoggerFactory.getLogger(PermissionServiceImpl.class);
    private static final String PERMISSION_PASS_CLASS_PATTERN = "com.jlu";

    private Set<String> whiteUrlList = new HashSet<>();
    private Set<String> adminUrlList = new HashSet<>();

    @Override
    public Boolean checkPermissionByParamType(String paramType, String paramValue, String username) {
        if (!NumberUtils.isNumber(paramValue)) {
            return false;
        }
        Long id = Long.parseLong(paramValue);
        switch (paramType) {
            case "recordId":

            default:
                break;
        }
        return true;
    }

    @Override
    public Set<String> getWhiteUrlList() {
        return whiteUrlList;
    }

    @Override
    public Set<String> getAdminUrlList() {
        return adminUrlList;
    }

    @Override
    public Boolean isStaticResource(HttpServletRequest request) {

        return request.getRequestURL().indexOf("resources/") > 0
                || request.getRequestURL().indexOf("static/") > 0
                || request.getRequestURL().indexOf("resources/css/") > 0
                || request.getRequestURL().indexOf("resources/js/") > 0
                || request.getRequestURL().indexOf("resources/images/") > 0
                || request.getRequestURL().indexOf("html/") > 0
                || request.getRequestURL().indexOf("error/") > 0
                || request.getRequestURL().indexOf("resource/") > 0
                || request.getRequestURL().indexOf("favicon.ico") > 0
                || request.getRequestURL().indexOf("webjars") > 0
                || request.getRequestURL().indexOf("public/") > 0
                || request.getRequestURL().indexOf("article/") > 0
                || request.getRequestURL().indexOf("jsp") > 0;

    }

    @Override
    public Boolean checkSourcePermission(Map<String, String> resourceParam, String username) {
        String owner = resourceParam.get("username");
        if (owner != null) {
            if (owner.equals(username)) {
                return true;
            } else {
                return false;
            }
        } else {
            // entrySet比keySet更有效
            Set<Map.Entry<String, String>> resourceParamEntrySet = resourceParam.entrySet();
            Boolean result = true;
            for (Map.Entry<String, String> entry : resourceParamEntrySet) {
                Boolean sourcePermission = checkPermissionByParamType(entry.getKey(), entry.getValue(), username);
                result = result && sourcePermission;
            }
            return result;

        }

    }

    @PostConstruct
    public void initWhiteListUrl() {
        initSetBySpringMvcAnnotation(PERMISSION_PASS_CLASS_PATTERN, PermissionPass.class, whiteUrlList);
        logger.info("admin ulr list:{}", whiteUrlList);

    }

    @PostConstruct
    public void initAdminListUrl() {
        initSetBySpringMvcAnnotation(PERMISSION_PASS_CLASS_PATTERN, PermissionAdmin.class, adminUrlList);
        logger.info("white ulr list:{}", adminUrlList);

    }

    private void initSetBySpringMvcAnnotation(String packageScan, Class<? extends Annotation> annotationClass, Set
            toSet) {
        Set<String> controllerClassSet = PackageScanUtils.findPackageAnnotationClass(packageScan,
                Controller.class, RestController.class);
        if (CollUtils.isEmpty(controllerClassSet)) {
            return;
        }
        for (String classPath : controllerClassSet) {
            try {
                Class controllerClass = Class.forName(classPath);
                // 父url
                String[] parentUrls;
                RequestMapping requestMappingAnno =
                        (RequestMapping) controllerClass.getAnnotation(RequestMapping.class);
                if (requestMappingAnno == null) {
                    parentUrls = null;
                } else {
                    parentUrls = requestMappingAnno.value();
                }
                // 如果类上面加了PermissionAdmin注解，则类下面所有url全部都不需要鉴权
                Boolean isClassPermissionPass = controllerClass.isAnnotationPresent(annotationClass);
                if (isClassPermissionPass) {
                    Method[] methods = controllerClass.getDeclaredMethods();
                    for (Method method : methods) {
                        RequestMapping requestMappingClass = method.getDeclaredAnnotation(RequestMapping.class);
                        if (requestMappingClass == null) {
                            continue;
                        }
                        String[] urls = requestMappingClass.value();
                        CollUtils.addAll(toSet, CollUtils.combination(parentUrls, urls).iterator());
                    }
                } else { // 类没有加PermissionAdmin注解，扫描方法上的注解
                    Method[] methods = controllerClass.getDeclaredMethods();
                    for (Method method : methods) {
                        Boolean isMethodPermissionPass = method.isAnnotationPresent(annotationClass);
                        if (isMethodPermissionPass) {
                            RequestMapping requestMappingClass = method.getDeclaredAnnotation(RequestMapping.class);
                            if (requestMappingClass == null) {
                                continue;
                            }
                            String[] urls = requestMappingClass.value();
                            CollUtils.addAll(toSet, CollUtils.combination(parentUrls, urls).iterator());
                        }
                    }
                }
            } catch (Exception e) {
                logger.info("Scan {} Class error:", classPath, e);
            }
        }
    }

}
