/**
 * @Author wpzhang
 * @Date 2019/6/12
 * @Description
 */
package com.itek.netctoss.domain;

import java.util.Objects;

/**
 * @program: netctoss
 * @description: 账务账户信息列表类
 * @author: wpzhang
 * @create: 2019-06-12 08:36
 **/
public class Account {
    public Account(){}

    public Account(Integer id, String realName, String idcardNo, String loginName, String status, String createDate, String lastLoginTime) {
        this.id = id;
        this.realName = realName;
        this.idcardNo = idcardNo;
        this.loginName = loginName;
        this.status = status;
        this.createDate = createDate;
        this.lastLoginTime = lastLoginTime;
    }

    public Account(Integer id, Integer recommenderId, String loginName, String loginPasswd, String status, String createDate, String pauseDate, String closeDate, String realName, String idcardNo, String birthday, String gender, String occupation, String telephone, String email, String emailaddress, String zipcode, String qq, String lastLoginTime, String lastLoginIp, Integer start, Integer pageSize) {
        this.id = id;
        this.recommenderId = recommenderId;
        this.loginName = loginName;
        this.loginPasswd = loginPasswd;
        this.status = status;
        this.createDate = createDate;
        this.pauseDate = pauseDate;
        this.closeDate = closeDate;
        this.realName = realName;
        this.idcardNo = idcardNo;
        this.birthday = birthday;
        this.gender = gender;
        this.occupation = occupation;
        this.telephone = telephone;
        this.email = email;
        this.emailaddress = emailaddress;
        this.zipcode = zipcode;
        this.qq = qq;
        this.lastLoginTime = lastLoginTime;
        this.lastLoginIp = lastLoginIp;
        this.start = start;
        this.pageSize = pageSize;
    }

    private Integer id;
    private Integer recommenderId;
    private String loginName;
    private String loginPasswd;
    private String status;
    private String createDate;
    private String pauseDate;
    private String closeDate;
    private String realName;
    private String idcardNo;
    private String birthday;
    private String gender;
    private String occupation;
    private String telephone;
    private String email;
    private String emailaddress;
    private String zipcode;
    private String qq;
    private String lastLoginTime;
    private String lastLoginIp;
    private Integer start;
    private Integer pageSize;


    public Account(String idCard, String realName, String loginName, String status) {
        this.idcardNo = idCard;
        this.realName = realName;
        this.loginName = loginName;
        this.status = status;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRecommenderId() {
        return recommenderId;
    }

    public void setRecommenderId(Integer recommenderId) {
        this.recommenderId = recommenderId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPasswd() {
        return loginPasswd;
    }

    public void setLoginPasswd(String loginPasswd) {
        this.loginPasswd = loginPasswd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getPauseDate() {
        return pauseDate;
    }

    public void setPauseDate(String pauseDate) {
        this.pauseDate = pauseDate;
    }

    public String getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(String closeDate) {
        this.closeDate = closeDate;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getIdcardNo() {
        return idcardNo;
    }

    public void setIdcardNo(String idcardNo) {
        this.idcardNo = idcardNo;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
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

    public String getEmailaddress() {
        return emailaddress;
    }

    public void setEmailaddress(String emailaddress) {
        this.emailaddress = emailaddress;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }


    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }


    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", recommenderId=" + recommenderId +
                ", loginName='" + loginName + '\'' +
                ", loginPasswd='" + loginPasswd + '\'' +
                ", status='" + status + '\'' +
                ", createDate='" + createDate + '\'' +
                ", pauseDate='" + pauseDate + '\'' +
                ", closeDate='" + closeDate + '\'' +
                ", realName='" + realName + '\'' +
                ", idcardNo='" + idcardNo + '\'' +
                ", birthday='" + birthday + '\'' +
                ", gender='" + gender + '\'' +
                ", occupation='" + occupation + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", emailaddress='" + emailaddress + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", qq='" + qq + '\'' +
                ", lastLoginTime='" + lastLoginTime + '\'' +
                ", lastLoginIp='" + lastLoginIp + '\'' +
                ", start=" + start +
                ", pageSize=" + pageSize +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Account account = (Account) o;
        return Objects.equals(id, account.id) &&
                Objects.equals(recommenderId, account.recommenderId) &&
                Objects.equals(loginName, account.loginName) &&
                Objects.equals(loginPasswd, account.loginPasswd) &&
                Objects.equals(status, account.status) &&
                Objects.equals(createDate, account.createDate) &&
                Objects.equals(pauseDate, account.pauseDate) &&
                Objects.equals(closeDate, account.closeDate) &&
                Objects.equals(realName, account.realName) &&
                Objects.equals(idcardNo, account.idcardNo) &&
                Objects.equals(birthday, account.birthday) &&
                Objects.equals(gender, account.gender) &&
                Objects.equals(occupation, account.occupation) &&
                Objects.equals(telephone, account.telephone) &&
                Objects.equals(email, account.email) &&
                Objects.equals(emailaddress, account.emailaddress) &&
                Objects.equals(zipcode, account.zipcode) &&
                Objects.equals(qq, account.qq) &&
                Objects.equals(lastLoginTime, account.lastLoginTime) &&
                Objects.equals(lastLoginIp, account.lastLoginIp);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, recommenderId, loginName, loginPasswd, status, createDate, pauseDate, closeDate, realName, idcardNo, birthday, gender, occupation, telephone, email, emailaddress, zipcode, qq, lastLoginTime, lastLoginIp);
    }
}