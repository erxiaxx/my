package org.erxiaxx.myc2c.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.erxiaxx.myc2c.domain.Common;

import java.util.List;

@Mapper
public interface BuyerMapper {
    @Select("select b_id from buyer where b_name=#{b_name}")
    Integer findBid(String b_name);

    @Select("select seller.s_name from `order` " +
            "left join seller on `order`.s_id=seller.s_id  " +
            "where o_id=#{o_id}")
    String findSname(long o_id);

    @Select("select seller.s_name,`order`.o_id,`order`.o_price,`order`.o_state from `order` " +
            "left join seller on `order`.s_id=seller.s_id " +
            "where b_id=#{b_id} and `order`.o_state=0 ")
    List<Common> findOrder(@Param("startIndex")Integer startIndex, @Param("pageSize")Integer pageSize, @Param("b_id")Integer b_id);

    @Select("select seller.s_name,`order`.o_id,`order`.o_price,`order`.o_state from `order` " +
            "left join seller on `order`.s_id=seller.s_id " +
            "where b_id=#{b_id} and `order`.o_state=1")
    List<Common> findHistory(@Param("startIndex")Integer startIndex, @Param("pageSize")Integer pageSize, @Param("b_id")Integer b_id);

    @Update("update `order` set o_state=1 where o_id=#{o_id}")
    void updateState(@Param("o_id") long o_id);

    @Select("select count(*) from `order` where b_id=#{b_id}")
    int getRowCount(Integer b_id);
}
