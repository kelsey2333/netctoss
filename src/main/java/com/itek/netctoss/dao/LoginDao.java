package com.itek.netctoss.dao;

import com.itek.netctoss.domain.UserSpring;

public interface LoginDao {
    UserSpring selectUser(UserSpring userSpring);
}
