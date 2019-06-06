package org.erxiaxx.myc2c.service;

import org.erxiaxx.myc2c.dao.LoginMapper;
import org.erxiaxx.myc2c.domain.Buyer;
import org.erxiaxx.myc2c.domain.Seller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private LoginMapper loginMapper;

    public Buyer findBuyer(Buyer buyer){
        return loginMapper.findBuyer(buyer);
    }

    public Seller findSeller(Seller seller){
        return loginMapper.findSeller(seller);
    }

    public Integer addBuyer(Buyer buyer) {
        Integer b = loginMapper.addBuyer(buyer);
        return b;
    }
}
