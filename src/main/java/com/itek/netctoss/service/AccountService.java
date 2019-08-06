package com.itek.netctoss.service;

import com.itek.netctoss.domain.Account;

import java.util.List;

public interface AccountService {
 List<Account> selectAccountInfo(Account account);
 int getAccountEndPage();
 int getFuzzyQueryEndPage(Account account);
 void addAccounts(Account addaccount);
 int updateAccount(Account account);
 void delStatusById(Account account);
 void modiById(Account modiAccount);
 Integer selectByIdCard(String recommenderIdCard);
}
