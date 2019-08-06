/**
 * @Author wpzhang
 * @Date 2019/7/15
 * @Description
 */
package com.itek.netctoss.controller;

import com.itek.netctoss.commons.Consts;
import com.itek.netctoss.commons.ServiceResult;
import com.itek.netctoss.domain.Account;
import com.itek.netctoss.service.AccountService;
import net.sf.json.JSONArray;
import oracle.jdbc.driver.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @program: netctoss
 * @description:
 * @author: wpzhang
 * @create: 2019-07-15 15:57
 **/
@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    @Qualifier("accountService")
  private AccountService accountService;

    /*
     *显示account
     */
    @RequestMapping("/list.do")
    public String listPage(String pageNo, Account account, Model model){
        if (pageNo == null || "".equals(pageNo)){
            pageNo = "1";
        }
        model.addAttribute("curPage",pageNo);
        int endPage = accountService.getAccountEndPage();
        int fuzzyQueryEndPage = accountService.getFuzzyQueryEndPage(account);
        // 状态不需要考虑
        if (account.getIdcardNo() != null || account.getLoginName() != null || account.getRealName() != null) {
            model.addAttribute("endPage", fuzzyQueryEndPage);
        } else {
            model.addAttribute("endPage", endPage);
        }
        //进行分页查询
        int start = ((Integer.parseInt(pageNo) -1)) * Consts.PAGE_SIZE;
        int pageSize = Consts.PAGE_SIZE;
        account.setPageSize(pageSize);
        account.setStart(start);
        List<Account> accounts = accountService.selectAccountInfo(account);
        model.addAttribute("accounts", accounts);
        return "account/list";
    }
    /*
     *增加页面
     */
    @RequestMapping("/add.do")
    public String addPage(String pageNo){
        return "account/add";
    }
    /*
     *提交增加数据
     */
    @RequestMapping("/addAcc.do")
    public String add(Account account){
        //创建时间
        Date date = new Date();
        date.setTime(System.currentTimeMillis());
        String createDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
        account.setCreateDate(createDate);
        //通过用户名判断是否开通
        if (account.getLoginName() != null) {
            account.setStatus("1");
        } else {
           account.setStatus("0");
        }
        String occupationName = getOccupationByVal(account.getOccupation());
        account.setOccupation(occupationName);
        accountService.addAccounts(account);
        return "redirect:/account/list.do";
    }
    /*
     *删除
     */
    @ResponseBody
    @RequestMapping("/del.do")
    public String delAcc(Account account){
        System.out.println("del的account:"+account);
        accountService.delStatusById(account);
        return "1";
    }

    /*
     *修改状态
     */
    @ResponseBody
    @RequestMapping("/status.do")
    public String modiStatus(Account account){
        //修改状态
        int count = accountService.updateAccount(account);
        if (count == 1){
            return "1";
        }else{
            return "-1";
        }
    }

    /*
     *修改页面
     */
    @RequestMapping("/modi.do")
    public String modiPage(){
        return "account/modi";
    }

    /*
     *进行修改
     */
    @RequestMapping("/modiAcc.do")
    public String modi(Account account){
        accountService.modiById(account);
        return "redirect:/account/list.do";
    }

    /*
     *首页尾页ajax
     */
    @ResponseBody
    @RequestMapping(value = "/jsonList.do",produces = "application/json;charset=utf-8")
    public List<Account> ajax(String pageNo, Account account ){
        //获取点击下一页的属性值
        int endPageJ = accountService.getAccountEndPage();
        int fuzzyQueryEndPageJ = accountService.getFuzzyQueryEndPage(account);
        //都一次进去list.acc里没有传入任何pageNo，需设默认值pageNo为1；
        if (pageNo == null) {
            pageNo = "1";
        }
        //进行分页查询
        int start = ((Integer.parseInt(pageNo) -1)) * Consts.PAGE_SIZE;
        int pageSize = Consts.PAGE_SIZE;
        account.setPageSize(pageSize);
        account.setStart(start);
        List<Account> accounts = accountService.selectAccountInfo(account);
        //返回集合
        return accounts;
    }

    /**
     * @Param
     * 将下拉选中的value值转换为相应职位
     */
    private String getOccupationByVal(String occupation) {
        //通过occupation 0 1 2 3 value值转换成响应职位
        switch (occupation) {
            case "0":
                occupation = "干部";
                break;
            case "1":
                occupation = "学生";
                break;
            case "2":
                occupation = "技术人员";
                break;
            case "3":
                occupation = "其他";
                break;
        }
        return occupation;
    }

}