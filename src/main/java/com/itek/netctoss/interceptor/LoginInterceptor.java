/**
 * @Author wpzhang
 * @Date 2019/7/6
 * @Description
 */
package com.itek.netctoss.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @program: netctoss
 * @description:
 * @author: wpzhang
 * @create: 2019-07-06 14:52
 **/
public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String loginName = (String)request.getSession().getAttribute("loginName");
        if (loginName == null){
            //重定向到登录页面
            response.sendRedirect(request.getContextPath()+"/login.do");
            System.out.println("false");
            return false;
        }else{
            System.out.println("true");
            return true;
        }
    }
}