/**
 * @Author wpzhang
 * @Date 2019/6/11
 * @Description
 */
package com.itek.netctoss.service.impl;

import com.itek.netctoss.service.MenuService;
import com.itek.netctoss.dao.AdminDao;
import com.itek.netctoss.domain.Menu;
import com.itek.netctoss.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: netctoss
 * @description: 菜单业务接口实现类
 * @author: wpzhang
 * @create: 2019-06-11 18:49
 **/
@Service("menuService")
public class MenuServiceImpl implements MenuService {
    @Autowired
    private AdminDao adminDao;
    @Override
    public List<Menu> SelectMenusByUserId(User user) {
        List<Menu> menus =  adminDao.selectMenuById(user);
        return menus;
    }

    @Override
    public User selectUserByName(User user) {
        return adminDao.selectUserByName(user);
    }
}