package org.erxiaxx.myc2c.domain;

import lombok.Data;

@Data
public class Buyer {
    //用户id
    private Integer b_id;
    //用户名
    private String b_name;
    //买家登录密码
    private String b_password;
    //买家电话
    private String b_phone;
}
