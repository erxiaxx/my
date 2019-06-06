package org.erxiaxx.myc2c.domain;

import lombok.Data;

@Data
public class Common {
    //用户id
    private Integer b_id;
    //用户名
    private String b_name;
    //卖家id
    private Integer s_id;
    //卖家用户名
    private String s_name;
    //卖家等级
    private Integer s_level;
    //订单ID
    private long o_id;
    //订单价格
    private double o_price;
    //订单状态
    private Integer o_state;
    //商品ID
    private Integer go_id;
    //商品状态
    private Integer go_state;
    //商品数量
    private Integer go_num;
    //商品图片
    private String go_pic;
    //计算数量价格
    private double count_price;
    //商品名
    private String go_name;
    //商品价格
    private double go_price;
    //游戏ID
    private Integer ga_id;
    //游戏名称
    private String ga_name;
}
