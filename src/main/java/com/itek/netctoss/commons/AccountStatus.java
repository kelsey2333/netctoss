package com.itek.netctoss.commons;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public enum AccountStatus {
    //默认无参构造器
    START("0","暂停"),
    PAUSE("1","开通"),
    DELETE("2","删除"),
    Will_Delete("3","待删除");

    String status;
    String msg;

    AccountStatus(String status, String msg) {
        this.status = status;
        this.msg = msg;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "AccountStatus{" +
                "status='" + status + '\'' +
                ", msg='" + msg + '\'' +
                '}';
    }
    //遍历所有枚举类型
    public static String toJsonStr(){
        AccountStatus[]  accountStatus =  AccountStatus.values();
        JSONArray jsonArray = new JSONArray();
        for (AccountStatus accountStatus1 : accountStatus){
            String status = accountStatus1.getStatus();
            String msgs = accountStatus1.getMsg();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("status",status);
            jsonObject.put("msgs",msgs);
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }

    public static void main(String[] args) {
        System.out.println(toJsonStr());
    }
}
