package org.erxiaxx.myc2c.domain;

import lombok.Data;

@Data
public class Seller {
    //卖家id
    private Integer s_id;
    //卖家用户名
    private String s_name;
    //卖家登录密码
    private String s_password;
    //卖家电话
    private String s_phone;
    //卖家邮箱
    private String s_mail;
}
