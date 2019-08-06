/**
 * @Author wpzhang
 * @Date 2019/7/4
 * @Description
 */
package com.itek.netctoss.domain;

/**
 * @program: netctossAjax
 * @description:
 * @author: wpzhang
 * @create: 2019-07-04 19:11
 **/
public class CostParam {
    public CostParam(){}
    private String costSort;//asc desc
    private String timeSort;//asc desc
    private String sortName;//cost duration
    public static final int PAGE_SIZE = 3;//pageSize
    private Integer start;//int start = (pageNo -1) * pageSize;


    public void setStart(Integer start) {
        this.start = start;
    }

    //默认是costSort
    public CostParam(String costSort, String sortName, Integer start){
        this.costSort = costSort;
        this.sortName = sortName;
        this.start = start;
    }

    public String getTimeSort() {
        return timeSort;
    }

    public void setTimeSort(String timeSort) {
        this.timeSort = timeSort;
    }

    public String getCostSort() {
        return costSort;
    }

    public void setCostSort(String costSort) {
        this.costSort = costSort;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }


    @Override
    public String toString() {
        return "CostParam{" +
                "costSort='" + costSort + '\'' +
                ", timeSort='" + timeSort + '\'' +
                ", sortName='" + sortName + '\'' +
                ", start=" + start +
                '}';
    }
}