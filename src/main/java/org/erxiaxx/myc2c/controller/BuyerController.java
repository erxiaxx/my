package org.erxiaxx.myc2c.controller;

import org.erxiaxx.myc2c.VO.PageVO;
import org.erxiaxx.myc2c.dao.BuyerMapper;
import org.erxiaxx.myc2c.service.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/buyer")
public class BuyerController {

    @Autowired
    private BuyerService buyerService;

    @RequestMapping("/bHome")
    public String sellerIndex() {
        return "user/buyer/bHome";
    }

    @RequestMapping("/welcome")
    public String sellerWelcome() {
        return "user/welcome";
    }

    @RequestMapping("/queryOrder")
    public String sellerOrderList() {
        return "user/buyer/queryOrder";
    }

    @RequestMapping("/dealHistory")
    public String dealHistory(){
        return "user/buyer/dealHistory";
    }

    @RequestMapping("/toMall")
    public String toMall(){
        return "mall";
    }

    @RequestMapping("/disQr")
    public String disQrcode() {
        return "user/seller/disQrcode";
    }

    @RequestMapping("/selectOrder")
    @ResponseBody
    public PageVO findOrder(Integer page, Integer limit, HttpServletRequest request){
        Object session = request.getSession().getAttribute("b_name");
        String b_name = session.toString();
        PageVO vo = buyerService.findOrder(page,limit,b_name);
        return vo;
    }

    @RequestMapping("/selectHistory")
    @ResponseBody
    public PageVO findHistory(Integer page, Integer limit, HttpServletRequest request){
        Object session = request.getSession().getAttribute("b_name");
        String b_name = session.toString();
        PageVO vo = buyerService.findHistory(page,limit,b_name);
        return vo;
    }

    @RequestMapping("/updateState")
    @ResponseBody
    public String updateState(long o_id){
        String result = "";
        try{
            buyerService.updateState(o_id);
            result = "ok";
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

}
