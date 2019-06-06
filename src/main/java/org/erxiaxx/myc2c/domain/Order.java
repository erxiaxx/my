package org.erxiaxx.myc2c.domain;

import lombok.Data;

@Data
public class Order {
    //订单ID
    private Integer o_id;
    //买家ID
    private Integer b_id;
    //卖家ID
    private Integer s_id;
    //订单价格
    private double o_price;
    //订单状态
    private Integer o_state;
}
