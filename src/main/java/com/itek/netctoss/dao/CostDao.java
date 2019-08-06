package com.itek.netctoss.dao;

import com.itek.netctoss.domain.Cost;
import com.itek.netctoss.domain.CostParam;

import java.io.IOException;
import java.util.List;

public interface CostDao {

    List<Cost> selectAll(CostParam costParam) throws IOException;

    int getSelectCount();

    void modiStatus(Cost cost);

    void insertCost(Cost cost);

    String selectCostType(Cost cost);

    void updateCost(Cost cost);
}
