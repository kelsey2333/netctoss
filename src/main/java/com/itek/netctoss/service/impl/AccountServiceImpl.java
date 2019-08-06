/**
 * @Author wpzhang
 * @Date 2019/6/12
 * @Description
 */
package com.itek.netctoss.service.impl;

import com.itek.netctoss.service.AccountService;
import com.itek.netctoss.commons.Consts;
import com.itek.netctoss.dao.AccountDao;
import com.itek.netctoss.domain.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: netctoss
 * @description: 账务账号接口实现类
 * @author: wpzhang
 * @create: 2019-06-12 08:43
 **/
@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Autowired
   private AccountDao accountDao ;
    @Override
    public List<Account> selectAccountInfo(Account account) {
//       List<Account> accounts = accountDao.selectAll();
        List<Account> accounts = accountDao.selectAllByPage(account);
        //如何去定义传参传入又有int型，又有实体类型
        return accounts;
    }

    @Override
    public int getAccountEndPage() {
        return accountDao.getSelectCount()/ Consts.PAGE_SIZE + (accountDao.getSelectCount()%Consts.PAGE_SIZE == 0 ? 0 : 1);
}

    @Override
    public int getFuzzyQueryEndPage(Account account) {
        return accountDao.getFuzzyQueryCount(account)/ Consts.PAGE_SIZE + (accountDao.getFuzzyQueryCount(account)%Consts.PAGE_SIZE == 0 ? 0 : 1);
    }

    @Override
    public void addAccounts(Account addaccount) {
        accountDao.addAccounts(addaccount);
    }

    @Override
    public int updateAccount(Account account) {
        return accountDao.updateAccount(account);
    }

    @Override
    public void delStatusById(Account account) {
        accountDao.delStatusById(account);
    }

    @Override
    public void modiById(Account modiAccount) {
        accountDao.modiAccount(modiAccount);
    }

    @Override
    public Integer selectByIdCard(String recommenderIdCard) {
        return accountDao.selectByIdCard(recommenderIdCard);
    }



}