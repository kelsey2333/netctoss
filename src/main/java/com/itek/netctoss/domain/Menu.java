/**
 * @Author wpzhang
 * @Date 2019/6/11
 * @Description
 */
package com.itek.netctoss.domain;

import java.util.Objects;

/**
 * @program: netctoss
 * @description: 菜单列表类
 * @author: wpzhang
 * @create: 2019-06-11 18:45
 **/
public class Menu {
    public Menu(){}
    private Integer id;
    private String href;
    private String clazz;

    public Menu(Integer id, String href, String clazz) {
        this.id = id;
        this.href = href;
        this.clazz = clazz;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", href='" + href + '\'' +
                ", clazz='" + clazz + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Menu menu = (Menu) o;
        return Objects.equals(id, menu.id) &&
                Objects.equals(href, menu.href) &&
                Objects.equals(clazz, menu.clazz);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, href, clazz);
    }
}