package com.uniquelry.jgs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description  首页或者权限url跳转控制器
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/18 22:23
 * @Version V1.0
 */
@Controller
public class IndexController {

	
    /**
     * 网站根目录请求
     * @return
     */
    @RequestMapping("/")
    public String root() {
    	return "redirect:/login.html";
    }
    
 
}
