package org.erxiaxx.myc2c.VO;

import lombok.Data;

@Data
public class PageVO {
    //res.status 解析接口状态
    private Integer code;
    //res.message 解析提示文本
    private String msg;
    //res.total 解析数据长度
    private Integer count;
    //res.data.item 解析数据列表
    private Object data;
}
