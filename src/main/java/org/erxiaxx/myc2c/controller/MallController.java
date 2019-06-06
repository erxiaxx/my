package org.erxiaxx.myc2c.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.erxiaxx.myc2c.domain.Buyer;
import org.erxiaxx.myc2c.domain.Cart;
import org.erxiaxx.myc2c.domain.Common;
import org.erxiaxx.myc2c.service.MallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class MallController {

    @Autowired
    private MallService mallService;

    @RequestMapping("/")
    public String welcome(){
        return "mall";
    }

    @RequestMapping("/hello")
    public String hello(){
        return "hello";
    }

    @RequestMapping("/register")
    public String register(){
        return "login/register";
    }

    @RequestMapping("/about")
    public String about(){
        return "about";
    }

    @RequestMapping("/commodity")
    public String commodity(String goods,Model model){
        if(StringUtils.isBlank(goods)){
            model.addAttribute("goods",mallService.findAll());
        }else{
            Common common = new Common();
            common.setGa_name(goods);
            model.addAttribute("goods",mallService.findByCondition(common));
        }
        return "commodity";
    }

    @RequestMapping("/shopOrder")
    public String shopOrder(){
        return "shopOrder";
    }


    @RequestMapping(value = "/addCart", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Object addCart(String go_id,String go_num, String count_price, HttpServletRequest request){
        Object b_name = request.getSession().getAttribute("b_name");
        JSONObject result = new JSONObject();
        if(b_name == null){
            result.put("result",0);
        }else{
            Integer b_id = mallService.findBid(b_name.toString());
            Cart cart = new Cart();
            cart.setB_id(b_id);
            cart.setGo_id(Integer.parseInt(go_id));
            cart.setGo_num(Integer.parseInt(go_num));
            cart.setCount_price(Integer.parseInt(count_price));
            mallService.insertCart(cart);
            result.put("result",1);
        }
        return result;
    }

    @RequestMapping(value = "/addOrder", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Object addOrder(String go_id,String go_num, String o_price, HttpServletRequest request){
        Object b_name = request.getSession().getAttribute("b_name");
        JSONObject result = new JSONObject();
        Integer b = Integer.parseInt(go_id);
        if(b_name == null){
            result.put("result",0);
        }else{
            Integer b_id = mallService.findBid(b_name.toString());
            Common c = mallService.findOrderNeed(b);
            SimpleDateFormat df = new SimpleDateFormat("MMddHHmmss");
            long o_id = Integer.valueOf(df.format(new Date()));
            Common common = new Common();
            common.setS_id(c.getS_id());
            common.setO_id(o_id);
            common.setGo_price(c.getGo_price());
            common.setB_id(b_id);
            common.setGo_id(Integer.parseInt(go_id));
            common.setGo_num(Integer.parseInt(go_num));
            common.setO_price(Integer.parseInt(o_price));
            mallService.insertOrder(common);
            mallService.insertDetail(common);
            result.put("result",1);
        }
        return result;
    }

    @RequestMapping("/shopCar")
    public String shopCar(Model model, HttpServletRequest request){
        Object b_name = request.getSession().getAttribute("b_name");
        if(b_name == null){
            model.addAttribute("cart",new ArrayList());
            model.addAttribute("msg","请先登录！");
        }else{
            Integer b_id = mallService.findBid(b_name.toString());
            Buyer buyer = new Buyer();
            buyer.setB_id(b_id);
            List cart = mallService.findBuyer(buyer);
            model.addAttribute("cart",cart);
        }
        return "shopcart";
    }

}
