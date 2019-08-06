/**
 * @Author wpzhang
 * @Date 2019/7/1
 * @Description
 */
package com.itek.netctoss.domain;

import java.util.Date;

/**
 * @program: netctossAjax
 * @description:
 * @author: wpzhang
 * @create: 2019-07-01 16:17
 **/
public class Cost {
    public Cost(){}
    private Integer id;
    private String name;
    private Integer baseDuration;
    private Double baseCost;
    private Double unitCost;
    private String creatime;
    private String startime;
    private String status;
    private String descr;
    private String typeVal;
    private String costtype;

    public String getCosttype() {
        return costtype;
    }

    public void setCosttype(String costtype) {
        this.costtype = costtype;
    }

    public String getTypeVal() {
        return typeVal;
    }

    public void setTypeVal(String typeVal) {
        this.typeVal = typeVal;
    }

    public Cost(Integer id, String name, Integer baseDuration, Double baseCost, Double unitCost, String creatime, String startime, String status, String descr,String typeVal,String costtype) {
        this.id = id;
        this.name = name;
        this.baseDuration = baseDuration;
        this.baseCost = baseCost;
        this.unitCost = unitCost;
        this.creatime = creatime;
        this.startime = startime;
        this.status = status;
        this.descr = descr;
        this.typeVal = typeVal;
        this.costtype = costtype;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Override
    public String toString() {
        return "Cost{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", baseDuration=" + baseDuration +
                ", baseCost=" + baseCost +
                ", unitCost=" + unitCost +
                ", creatime=" + creatime +
                ", startime=" + startime +
                ", status='" + status + '\'' +
                ", descr='" + descr + '\'' +
                ", typeVal='" + typeVal + '\'' +
                ", costtype='" + costtype + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getBaseDuration() {
        return baseDuration;
    }

    public void setBaseDuration(Integer baseDuration) {
        this.baseDuration = baseDuration;
    }

    public Double getBaseCost() {
        return baseCost;
    }

    public void setBaseCost(Double baseCost) {
        this.baseCost = baseCost;
    }

    public Double getUnitCost() {
        return unitCost;
    }

    public void setUnitCost(Double unitCost) {
        this.unitCost = unitCost;
    }

    public String getCreatime() {
        return creatime;
    }

    public void setCreatime(String creatime) {
        this.creatime = creatime;
    }

    public String getStartime() {
        return startime;
    }

    public void setStartime(String startime) {
        this.startime = startime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}