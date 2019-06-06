package org.erxiaxx.myc2c.controller;

import org.erxiaxx.myc2c.VO.PageVO;
import org.erxiaxx.myc2c.domain.Goods;
import org.erxiaxx.myc2c.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/seller")
public class SellerController {

    @Autowired
    private SellerService sellerService;

    @RequestMapping("/sHome")
    public String sellerIndex(){
        return "user/seller/sHome";
    }

    @RequestMapping("/welcome")
    public String sellerWelcome(){
        return "user/welcome";
    }

    @RequestMapping("/orderManage")
    public String sellerOrderList(){
        return "user/seller/orderManage";
    }

    @RequestMapping("/goodsManage")
    public String sellerGoodsManage(){
        return "user/seller/goodsManage";
    }

    @RequestMapping("/addGo")
    public String addGo(){
        return "user/seller/addGo";
    }

    @RequestMapping("/selectGoods")
    @ResponseBody
    public PageVO findGoods(Integer page,Integer limit,HttpServletRequest request){
        Object session = request.getSession().getAttribute("s_name");
        String s_name = session.toString();
        PageVO vo = sellerService.findGoods(page,limit,s_name);
        return vo;
    }

    @RequestMapping("/selectOrder")
    @ResponseBody
    public PageVO findOrder(Integer page,Integer limit,HttpServletRequest request){
        Object session = request.getSession().getAttribute("s_name");
        String s_name = session.toString();
        PageVO vo = sellerService.findOrder(page,limit,s_name);
        return vo;
    }

    @RequestMapping("/deleteGoodsById")
    @ResponseBody
    public String deleteGoodsById(Integer go_id){
        String result = "";
        try{
            sellerService.deleteGoodsById(go_id);
            result = "ok";
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping("/updateState")
    @ResponseBody
    public String updateState(Integer go_id, boolean flag){
        Integer go_state = flag == true?1:0;
        String result = "";
        try{
            sellerService.updateState(go_id,go_state);
            result = "ok";
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping("/addGoods")
    @ResponseBody
    public String addGoods(@RequestBody Goods goods,HttpServletRequest request){
        Object session = request.getSession().getAttribute("s_name");
        String s_name = session.toString();
        String result = "";
        try{
            sellerService.addGoods(goods,s_name);
            result = "ok";
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
