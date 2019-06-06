package org.erxiaxx.myc2c.controller;

import org.erxiaxx.myc2c.domain.Buyer;
import org.erxiaxx.myc2c.domain.Seller;
import org.erxiaxx.myc2c.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("/bLogin")
    public String bLogin(){
        return "login/bLogin";
    }

    @RequestMapping("/sLogin")
    public String sLogin(){
        return "login/sLogin";
    }

    /**
     * 买家登录
     * @return
     */
    @RequestMapping("/buyerLogin")
    public String login(HttpServletRequest request){
        Buyer buyer = new Buyer();
        buyer.setB_name(request.getParameter("b_name"));
        buyer.setB_password(request.getParameter("b_password"));
        Buyer b = loginService.findBuyer(buyer);
        if (b == null) {
            request.setAttribute("error","用户名、密码错误或者身份错误");
            return "login/bLogin";
        } else {
            request.getSession().setAttribute("b_name",buyer.getB_name());
            return "mall";
        }

    }

    /**
     * 卖家登录
     * @return
     */
    @RequestMapping("/sellerLogin")
    public String sellerLogin(HttpServletRequest request) {
        Seller seller = new Seller();
        seller.setS_name(request.getParameter("s_name"));
        seller.setS_password(request.getParameter("s_password"));
        Seller s = loginService.findSeller(seller);
        if (s == null) {
            request.setAttribute("error", "用户名、密码错误或者身份错误");
            return "login/sLogin";
        } else {
            request.getSession().setAttribute("s_name", seller.getS_name());
            return "user/seller/sHome";
        }
    }

    /**
     * 买家注册
     * @return
     */
    @RequestMapping("/buyerRegister")
    public String buyerRegister(HttpServletRequest request){
        Buyer buyer = new Buyer();
        buyer.setB_name(request.getParameter("b_name"));
        buyer.setB_password(request.getParameter("b_password"));
        buyer.setB_phone(request.getParameter("b_phone"));
        Integer b = loginService.addBuyer(buyer);
        if (b == null){
            request.setAttribute("error", "注册失败");
            return "login/register";
        } else {
            return "login/bLogin";
        }
    }

    /**
     * 买家退出
     * @return
     */
    @RequestMapping("/bExit")
    public String bExit(HttpServletRequest request){
        request.getSession().removeAttribute("b_name");
        return "mall";
    }

    /**
     * 卖家退出
     * @return
     */
    @RequestMapping("/sExit")
    public String sExit(HttpServletRequest request){
        request.getSession().removeAttribute("s_name");
        return "mall";
    }
}

