package com.itek.netctoss.dao;

import com.itek.netctoss.domain.Account;

import java.util.List;

public interface AccountDao {
    List<Account> selectAllByPage(Account account);
    int getSelectCount();
    int getFuzzyQueryCount(Account account);
    void addAccounts(Account addaccount);
    int updateAccount(Account account);
    void delStatusById(Account account);
    void modiAccount(Account modiAccount);

    Integer selectByIdCard(String recommenderIdCard);

}
