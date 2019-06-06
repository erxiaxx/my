package org.erxiaxx.myc2c.domain;

import lombok.Data;

@Data
public class Cart {
    //买家ID
    private Integer b_id;
    //商品ID
    private Integer go_id;
    //商品数量
    private Integer go_num;
    //计算数量价格
    private double count_price;
}
