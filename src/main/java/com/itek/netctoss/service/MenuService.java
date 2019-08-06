package com.itek.netctoss.service;

import com.itek.netctoss.domain.Menu;
import com.itek.netctoss.domain.User;

import java.util.List;

public interface MenuService {
    /**
     * @Param
     * @description 根据用户所拥有的id查询出用户所能访问的菜单列表
     * @date 2019/6/11 18:42
     * @return
     */
    List<Menu> SelectMenusByUserId(User user);
    User selectUserByName(User user);

}
