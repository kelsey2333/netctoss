/**
 * @Author wpzhang
 * @Date 2019/7/1
 * @Description
 */
package com.itek.netctoss.controller;

import com.itek.netctoss.service.CostService;
import com.itek.netctoss.domain.Cost;
import com.itek.netctoss.domain.CostParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @program: netctossAjax
 * @description:
 * @author: wpzhang
 * @create: 2019-07-01 15:51
 **/
@Controller
@RequestMapping("/cost")
public class CostController {
    @Autowired
    @Qualifier("costService")
    private CostService costService;
    @RequestMapping(value = "/list.do",produces = "text/html;charset=utf-8")
    public String list(Integer pageNo , CostParam costParam , Model model) throws IOException {
        if (costParam.getCostSort() == null){
            costParam.setCostSort("asc");//基费默认升序
            model.addAttribute("costSort",costParam.getCostSort());
        }
        if (costParam.getTimeSort() == null){
            costParam.setTimeSort("asc");//时长默认升序
        model.addAttribute("timeSort",costParam.getTimeSort());
    }
        if (pageNo == null){
            pageNo = 1;
        }
        int start = (pageNo -1) * costParam.PAGE_SIZE;
        costParam.setStart(start);
        List<Cost> result = costService.selectAll(costParam);
        /*
        1、第一次进行切换样式时两个会同时改变
        2、进入页面时按照id排序进行查询
        3、点击基费后按照基费进行排序
        4、点击时长进行排序时按照时长进行排序
         */
        //点击基费排序按钮
        if ("cost".equals(costParam.getSortName())) {
             result = costService.selectAll(costParam);//构造器是基费构造器
            //基费样式改变
            if(costParam.getCostSort().equals("asc")){
                costParam.setCostSort("desc");
                model.addAttribute("costSort",costParam.getCostSort());//基费排序(发到前端为下一次的排序上下键改变做准备)
            }else if (costParam.getCostSort().equals("desc")){
                costParam.setCostSort("asc");
                model.addAttribute("costSort",costParam.getCostSort());//基费排序(发到前端为下一次的排序上下键改变做准备)
            }
            //时长样式默认
                costParam.setTimeSort("asc");
                model.addAttribute("timeSort",costParam.getTimeSort());
        }
        //点击时长排序按钮
        if ("duration".equals(costParam.getSortName())) {
            costParam.setCostSort(costParam.getTimeSort());//将构造器转换成时长的构造器
            result = costService.selectAll(costParam);
            //时长样式改变
            if (costParam.getTimeSort().equals("asc")){
                costParam.setTimeSort("desc");
                model.addAttribute("timeSort",costParam.getTimeSort());//时长排序
            }else if (costParam.getTimeSort().equals("desc")){
                costParam.setTimeSort("asc");
                model.addAttribute("timeSort",costParam.getTimeSort());
            }
            //基费默认样式
            costParam.setCostSort("asc");
            model.addAttribute("costSort",costParam.getCostSort());
        }
            int endPage = costService.getEndPage();
            model.addAttribute("costs",result);//表中数据
            model.addAttribute("curPage",pageNo);//当前页
            model.addAttribute("sortName",costParam.getSortName());//按过的排序按钮名
            model.addAttribute("endPage",endPage);//末页
        return "cost/list";
    }
    @ResponseBody
    @RequestMapping(value="/status.do", produces="application/json;charset=utf-8")
    public String modiStatus(Cost cost) throws IOException {
       String startTime = getCreateAndStartTime();
       cost.setStartime(startTime);
       costService.modiStatus(cost);
       return "1";
    }
    @RequestMapping(value = "/addCost.do",produces = "text/html;charset=utf-8")
    public String add(Model model,String pageNo){
        // 绑定末页将数据增加到最后一页
        model.addAttribute("pageNo",pageNo);
        return "cost/addCost";
    }
    @RequestMapping(value = "/modiCost.do",produces = "text/html;charset=utf-8")
    public String modi(Model model,Cost cost){
        String costType = costService.selectCostType(cost);
        cost.setCosttype(costType);
        model.addAttribute("cost",cost);
        return "cost/modiCost";
    }
    @RequestMapping(value = "/addCostList.do",produces = "text/html;charset=utf-8")
    public String addCostList(Cost cost){
        String creatime = getCreateAndStartTime();
        cost.setCreatime(creatime);
        //接收到的值设置为包月套餐计时形式拼接到name后
        setTypeString(cost.getCosttype(),cost);
        //数据库增加
        costService.insertCost(cost);
        //显示到界面
        return "redirect:/cost/list.do";
    }
    @RequestMapping(value = "/midiCost.do",produces = "text/html;charset=utf-8")
    public String modiCostList(Cost cost){
        //更新数据到list界面
        costService.updateCost(cost);
        return "redirect:/cost/list.do";
    }


    private String getCreateAndStartTime() {
        //创建时间
        Date date = new Date();
        date.setTime(System.currentTimeMillis());
        String startOrCreate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        return startOrCreate;
    }

    private void setTypeString(String costtype,Cost cost) {
        switch (costtype){
            case "1":
                cost.setTypeVal("包月");
                cost.setName(cost.getName()+"包月");
                break;
            case "2":
                cost.setTypeVal("套餐");
                cost.setName(cost.getName()+"套餐");
                break;
            case "3":
                cost.setTypeVal("计时");
                cost.setName(cost.getName()+"计时");
                break;
        }
    }
}