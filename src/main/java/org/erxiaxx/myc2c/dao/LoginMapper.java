package org.erxiaxx.myc2c.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.erxiaxx.myc2c.domain.Buyer;
import org.erxiaxx.myc2c.domain.Seller;

@Mapper
public interface LoginMapper {

    //买家登录
    @Select("select * from buyer where b_name=#{b_name} and b_password=#{b_password}")
    Buyer findBuyer(Buyer buyer);

    //卖家登录
    @Select("select * from seller where s_name=#{s_name} and s_password=#{s_password}")
    Seller findSeller(Seller seller);

    @Insert("insert into buyer (b_name,b_password,b_phone) values(#{b_name},#{b_password},#{b_phone})")
    Integer addBuyer(Buyer buyer);
}
