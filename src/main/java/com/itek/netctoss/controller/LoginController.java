/**
 * @Author wpzhang
 * @Date 2019/7/1
 * @Description
 */
package com.itek.netctoss.controller;

import com.itek.netctoss.service.LoginService;
import com.itek.netctoss.service.MenuService;
import com.itek.netctoss.commons.ResultCode;
import com.itek.netctoss.commons.ServiceResult;
import com.itek.netctoss.domain.Menu;
import com.itek.netctoss.domain.User;
import com.itek.netctoss.domain.UserSpring;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;

/**
 * @program: netctossAjax
 * @description:
 * @author: wpzhang
 * @create: 2019-07-01 20:19
 **/
@Controller
public class LoginController {
    @Autowired
    @Qualifier("loginService")
    private LoginService loginService;
    @RequestMapping("/login.do")
    public String login(){
        return "login";
    }
    @RequestMapping("/checkLogin.do")
    public String checkLogin(UserSpring userSpring, HttpServletRequest request, Model model){
       ServiceResult<UserSpring> result = loginService.checkLogin(userSpring);
        if (result.getCode() == ResultCode.SUCCESS.getCode()){
            //保存用户信息到session中
            request.getSession().setAttribute("loginName",result.getData().getLoginName());
            request.getSession().setAttribute("pwd",result.getData().getPwd());
            //重定向到首页（地址栏信息要改变）
            return "redirect:/index.do";
        }else{
            model.addAttribute("msg",result.getMsg());
            return "login";
        }
    }

    @RequestMapping("/captcha.do")
    public String captcha(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 1. 创建画板
        BufferedImage image = new BufferedImage(80, 20, BufferedImage.TYPE_INT_RGB);
        // 2. 创建画笔
        Graphics g = image.getGraphics();
        // 3. 设置画笔颜色
        Random r = new Random();
        g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
        // 4. 绘制背景颜色
        g.fillRect(0, 0, 80, 20);
        // 5. 绘制随机生成字符串
        String randomStr = generateRandomString(1);
        HttpSession CapSession = req.getSession();
        CapSession.setAttribute("cap", randomStr);
        // 6. 设置字体
        g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
        g.setFont(new Font("微软雅黑", Font.BOLD, 18));
        g.drawString(randomStr, 5, 15);
        // 7. 绘制干扰线
        for (int i = 1; i <= 8; i++) {
            g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
            g.drawLine(r.nextInt(80), r.nextInt(20), r.nextInt(80), r.nextInt(20));
        }


        // 8. 将图片输出到客户端
        resp.setContentType("image/jpeg");
        OutputStream os = resp.getOutputStream();
        ImageIO.write(image, "jpeg", os);
        os.close();
        return null;
    }

    private String generateRandomString(int length) {
        String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder sb = new StringBuilder();
        Random r = new Random();
        for (int i = 0; i < length; i++) {
            char ch = str.charAt(r.nextInt(36));
            sb.append(ch);
        }
        return sb.toString();
    }


    @Autowired
    @Qualifier("menuService")
    private MenuService menuService;

    @RequestMapping("/index.do")
    public String index(HttpServletRequest req,HttpServletRequest request){
        //获取到保存在session中的loginName
        String name = (String)request.getSession().getAttribute("loginName");
        User user =new User();
        user.setName(name);
        //通过name查询到用户id
        int id = menuService.selectUserByName(user).getId();
        //通过id查询用户所能访问的菜单列表
        user.setId(id);
        List<Menu> menus = menuService.SelectMenusByUserId(user);
        //将menu集合塞到session中
        request.getSession().setAttribute("menus", menus);
        return "index";
    }
}