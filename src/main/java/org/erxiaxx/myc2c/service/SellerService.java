package org.erxiaxx.myc2c.service;

import org.erxiaxx.myc2c.VO.PageVO;
import org.erxiaxx.myc2c.dao.SellerMapper;
import org.erxiaxx.myc2c.domain.Common;
import org.erxiaxx.myc2c.domain.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SellerService {

    @Autowired
    private SellerMapper sellerMapper;

    public PageVO findGoods(Integer currentPage,Integer pageSize,String s_name){
        //查询总记录数
        Integer s_id = sellerMapper.findSid(s_name);
        int totalCount = sellerMapper.getRowCountG(s_id);
        List<Common> list = sellerMapper.findGoods(1,pageSize,s_id);
        //封装数据
        PageVO vo1 = new PageVO();
        vo1.setCode(0);
        vo1.setMsg("ok");
        vo1.setCount(totalCount);
        vo1.setData(list);
        return vo1;
    }

    public PageVO findOrder(Integer currentPage,Integer pageSize,String s_name){
        //查询总记录数
        Integer s_id = sellerMapper.findSid(s_name);
        int totalCount = sellerMapper.getRowCountO(s_id);
        List<Common> list = sellerMapper.findOrder(1,pageSize,s_id);
        //封装数据
        PageVO vo2 = new PageVO();
        vo2.setCode(0);
        vo2.setMsg("ok");
        vo2.setCount(totalCount);
        vo2.setData(list);
        return vo2;
    }

    public void deleteGoodsById(Integer go_id){
        sellerMapper.deleteGoodsById(go_id);
    }

    public void updateState(Integer go_id, Integer go_state) {
        sellerMapper.updateState(go_id,go_state);
    }

    public void addGoods(Goods goods,String s_name) {
        Integer s_id = sellerMapper.findSid(s_name);
        goods.setS_id(s_id);
        sellerMapper.addGoods(goods);
    }
}
