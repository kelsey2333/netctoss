package com.itek.netctoss.service;

import com.itek.netctoss.commons.ServiceResult;
import com.itek.netctoss.domain.UserSpring;

public interface LoginService {
    ServiceResult<UserSpring> checkLogin(UserSpring userSpring);
}
