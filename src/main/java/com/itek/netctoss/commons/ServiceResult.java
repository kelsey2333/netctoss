/**
 * @Author wpzhang
 * @Date 2019/6/30
 * @Description
 */
package com.itek.netctoss.commons;

/**
 * @program: checkLoginSpring
 * @description: 业务处理结果类
 * @author: wpzhang
 * @create: 2019-06-30 14:20
 **/
public class ServiceResult<E> {
    private int code;
    private String msg;

    private E data;

    public E getData() {
        return data;
    }

    public void setData(E data) {
        this.data = data;
    }

    //默认情况下
    public ServiceResult(){
        //默认情况下code为1，msg为“请求成功”
        setServiceResult(ResultCode.SUCCESS);
    }

    public void setServiceResult(ResultCode resultCode){
        this.code = resultCode.getCode();
        this.msg = resultCode.getMsg();
    }

    public ServiceResult(int code, String msg) {
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