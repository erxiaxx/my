package org.erxiaxx.myc2c.domain;

import lombok.Data;

@Data
public class Goods {
    //商品ID
    private Integer go_id;
    //游戏ID
    private Integer ga_id;
    //卖家ID
    private Integer s_id;
    //商品状态
    private Integer go_state;
    //商品名
    private String go_name;
    //商品价格
    private double go_price;
}
