package com.itek.netctoss.commons;

public enum ResultCode {
    SUCCESS(1,"请求成功"),FAIL(2,"请求失败"),USERNAME_OR_PASSWORD_ERROR(1001,"用户名或密码错误");
    private int code;
    private String msg;

    ResultCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
