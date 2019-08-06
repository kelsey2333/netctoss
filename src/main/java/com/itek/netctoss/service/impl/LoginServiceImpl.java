/**
 * @Author wpzhang
 * @Date 2019/7/2
 * @Description
 */
package com.itek.netctoss.service.impl;

import com.itek.netctoss.commons.ResultCode;
import com.itek.netctoss.commons.ServiceResult;
import com.itek.netctoss.dao.LoginDao;
import com.itek.netctoss.domain.UserSpring;
import com.itek.netctoss.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: netctossAjax
 * @description:
 * @author: wpzhang
 * @create: 2019-07-02 05:42
 **/
@Service("loginService")
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;


    @Override
    public ServiceResult<UserSpring> checkLogin(UserSpring userSpring) {
       ServiceResult<UserSpring> result = new ServiceResult<>();
       UserSpring userSelected = loginDao.selectUser(userSpring);
       result.setData(userSelected);
       if (userSelected == null){
           result.setServiceResult(ResultCode.USERNAME_OR_PASSWORD_ERROR);
       }
       return result;
    }
}