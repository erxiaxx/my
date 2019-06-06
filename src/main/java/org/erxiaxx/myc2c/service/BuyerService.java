package org.erxiaxx.myc2c.service;

import org.erxiaxx.myc2c.VO.PageVO;
import org.erxiaxx.myc2c.dao.BuyerMapper;
import org.erxiaxx.myc2c.domain.Common;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuyerService {
    @Autowired
    private BuyerMapper buyerMapper;

    public PageVO findOrder(Integer currentPage,Integer pageSize,String b_name){
        //查询总记录数
        Integer b_id = buyerMapper.findBid(b_name);
        int totalCount = buyerMapper.getRowCount(b_id);
        List<Common> list = buyerMapper.findOrder(1,pageSize,b_id);
        //封装数据
        PageVO vo = new PageVO();
        vo.setCode(0);
        vo.setMsg("ok");
        vo.setCount(totalCount);
        vo.setData(list);
        return vo;
    }

    public void updateState(long o_id) {
        buyerMapper.updateState(o_id);
    }

    public PageVO findHistory(Integer page, Integer pageSize, String b_name) {
        //查询总记录数
        Integer b_id = buyerMapper.findBid(b_name);
        int totalCount = buyerMapper.getRowCount(b_id);
        List<Common> list = buyerMapper.findHistory(1,pageSize,b_id);
        //封装数据
        PageVO vo = new PageVO();
        vo.setCode(0);
        vo.setMsg("ok");
        vo.setCount(totalCount);
        vo.setData(list);
        return vo;
    }
}
