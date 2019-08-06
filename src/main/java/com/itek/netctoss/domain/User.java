/**
 * @Author wpzhang
 * @Date 2019/6/10
 * @Description
 */
package com.itek.netctoss.domain;

import java.util.Date;
import java.util.Objects;

/**
 * @program: netctoss
 * @description:
 * @author: wpzhang
 * @create: 2019-06-10 15:47
 **/
public class User {
    public User(){}
    private int id;
    private String adminCode;
    private String password;
    private String name;
    private String telephone;
    private String email;
    private Date enrolldate;

    public User(int id, String adminCode, String password, String name, String telephone, String email, Date enrolldate) {
        this.id = id;
        this.adminCode = adminCode;
        this.password = password;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.enrolldate = enrolldate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAdminCode() {
        return adminCode;
    }

    public void setAdminCode(String adminCode) {
        this.adminCode = adminCode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getEnrolldate() {
        return enrolldate;
    }

    public void setEnrolldate(Date enrolldate) {
        this.enrolldate = enrolldate;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", adminCode='" + adminCode + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", enrolldate=" + enrolldate +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id &&
                Objects.equals(adminCode, user.adminCode) &&
                Objects.equals(password, user.password) &&
                Objects.equals(name, user.name) &&
                Objects.equals(telephone, user.telephone) &&
                Objects.equals(email, user.email) &&
                Objects.equals(enrolldate, user.enrolldate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, adminCode, password, name, telephone, email, enrolldate);
    }
}