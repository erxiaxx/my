package org.erxiaxx.myc2c.dao;

import org.apache.ibatis.annotations.*;
import org.erxiaxx.myc2c.domain.Common;
import org.erxiaxx.myc2c.domain.Goods;

import java.util.List;

@Mapper
public interface SellerMapper {

    @Select("select s_id from seller where s_name=#{s_name}")
    Integer findSid(String s_name);

    @Select("select game.ga_name,goods.go_id,goods.go_name,goods.go_price,goods.go_state from goods " +
            "left join game on goods.ga_id=game.ga_id where s_id=#{s_id}")
    List<Common> findGoods(@Param("startIndex")Integer startIndex, @Param("pageSize")Integer pageSize, @Param("s_id")Integer s_id);

    @Select("select buyer.b_name,`order`.o_id,`order`.o_price,`order`.o_state from `order` " +
            "left join buyer on `order`.b_id=buyer.b_id where s_id=#{s_id}")
    List<Common> findOrder(@Param("startIndex")Integer startIndex, @Param("pageSize")Integer pageSize, @Param("s_id")Integer s_id);


    @Select("select count(*) from `order` where s_id=#{s_id}")
    int getRowCountO(Integer s_id);

    @Select("select count(*) from goods where s_id=#{s_id}")
    int getRowCountG(Integer s_id);

    @Delete("delete from goods where go_id=#{go_id}")
    void deleteGoodsById(Integer go_id);

    @Update("update goods set go_state=#{go_state} where go_id=#{go_id}")
    void updateState(@Param("go_id") Integer go_id,@Param("go_state") Integer go_state);

    @Insert("insert into goods (ga_id,s_id,go_name,go_price) values(#{ga_id},#{s_id},#{go_name},#{go_price})")
    void addGoods(Goods goods);

}
