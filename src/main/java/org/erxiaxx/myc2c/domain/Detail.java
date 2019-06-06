package org.erxiaxx.myc2c.domain;

import lombok.Data;

@Data
public class Detail {
    //订单ID
    private Integer o_id;
    //商品ID
    private Integer go_id;
    //商品数量
    private Integer go_num;
    //计算数量价格
    private double count_price;
}
