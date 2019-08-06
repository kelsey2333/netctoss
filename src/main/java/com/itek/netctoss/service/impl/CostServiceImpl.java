/**
 * @Author wpzhang
 * @Date 2019/7/1
 * @Description
 */
package com.itek.netctoss.service.impl;

import com.itek.netctoss.service.CostService;
import com.itek.netctoss.commons.Consts;
import com.itek.netctoss.dao.CostDao;
import com.itek.netctoss.domain.Cost;
import com.itek.netctoss.domain.CostParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

/**
 * @program: netctossAjax
 * @description:
 * @author: wpzhang
 * @create: 2019-07-01 16:22
 **/
@Service("costService")
public class CostServiceImpl implements CostService {
    @Autowired
    private CostDao costDao;

    @Override
    public List<Cost> selectAll(CostParam costParam) throws IOException {

        return costDao.selectAll(costParam);
    }

    @Override
    public int getEndPage() {
        return costDao.getSelectCount()/ Consts.PAGE_SIZE + (costDao.getSelectCount()%Consts.PAGE_SIZE == 0 ? 0 : 1);
    }

    @Override
    public void modiStatus(Cost cost) {
         costDao.modiStatus(cost);
    }

    @Override
    public void insertCost(Cost cost) {
        costDao.insertCost(cost);
    }

    @Override
    public String selectCostType(Cost cost) {
       return costDao.selectCostType(cost);
    }

    @Override
    public void updateCost(Cost cost) {
         costDao.updateCost(cost);
    }

}