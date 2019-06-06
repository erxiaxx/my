package org.erxiaxx.myc2c.service;

import org.erxiaxx.myc2c.dao.MallMapper;
import org.erxiaxx.myc2c.domain.Buyer;
import org.erxiaxx.myc2c.domain.Cart;
import org.erxiaxx.myc2c.domain.Common;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MallService {

    @Autowired
    private MallMapper mallMapper;

    public List<Common> findAll() {
       return mallMapper.findAll();
    }

    public List<Common> findByCondition(Common common){
        return mallMapper.findByCondition(common);
    }

    public List<Common> findBuyer(Buyer buyer){
        return mallMapper.findBuyer(buyer);
    }

    public void insertCart(Cart cart){
        mallMapper.insertCart(cart);
    }

    public void insertOrder(Common common){
        mallMapper.insertOrder(common);
    }

    public Common findOrderNeed(Integer go_id){
        return mallMapper.findOrderNeed(go_id);
    }

    public void insertDetail(Common common) {
        mallMapper.insertDetail(common);
    }

    public Integer findBid(String b_name) {
        return mallMapper.findBid(b_name);
    }
}
