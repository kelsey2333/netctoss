/**
 * @Author wpzhang
 * @Date 2019/7/2
 * @Description
 */
package com.itek.netctoss.domain;

/**
 * @program: netctossAjax
 * @description:
 * @author: wpzhang
 * @create: 2019-07-02 06:41
 **/
public class UserSpring {
    public UserSpring(){}
    private String loginName;
    private String pwd;
    private int id;

    public UserSpring(int id, String loginName, String pwd) {
        this.loginName = loginName;
        this.pwd = pwd;
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "UserSpring{" +
                "loginName='" + loginName + '\'' +
                ", pwd='" + pwd + '\'' +
                ", id=" + id +
                '}';
    }
}