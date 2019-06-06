package org.erxiaxx.myc2c.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.erxiaxx.myc2c.domain.Buyer;
import org.erxiaxx.myc2c.domain.Cart;
import org.erxiaxx.myc2c.domain.Common;
import org.erxiaxx.myc2c.domain.Order;

import java.util.List;

@Mapper
public interface MallMapper {

    @Select("select seller.s_name,seller.s_level,goods.go_id,goods.go_name,goods.go_price,go_pic,ga_name from goods " +
            "left join seller on goods.s_id=seller.s_id " +
            "left join game on goods.ga_id=game.ga_id " +
            "where goods.go_state=1")
    List<Common> findAll();

    @Select("select seller.s_name,seller.s_level,goods.go_id,goods.go_name,goods.go_price,go_pic,ga_name from goods " +
            "left join seller on goods.s_id=seller.s_id " +
            "left join game on goods.ga_id=game.ga_id " +
            "where game.ga_name like concat('%',#{ga_name},'%') and goods.go_state=1")
    List<Common> findByCondition(Common common);

    @Select("select cart.*,goods.go_name,goods.go_pic from cart " +
            "left join goods ON cart.go_id=goods.go_id where cart.b_id=#{b_id}")
    List<Common> findBuyer(Buyer buyer);

    @Insert("insert into cart (b_id,go_id,go_num,count_price) values(#{b_id},#{go_id},#{go_num},#{count_price})")
    void insertCart(Cart cart);

    @Select("select s_id,go_price from goods where go_id=#{go_id}")
    Common findOrderNeed(Integer go_id);

    @Insert("insert into `order` (o_id,b_id,s_id,o_price) values(#{o_id},#{b_id},#{s_id},#{o_price})")
    void insertOrder(Common common);

    @Insert("insert into detail (o_id,go_id,go_num,count_price) values(#{o_id},#{go_id},#{go_num},#{go_price})")
    void insertDetail(Common common);

    @Select("select b_id from buyer where b_name=#{b_name}")
    Integer findBid(String b_name);

}
