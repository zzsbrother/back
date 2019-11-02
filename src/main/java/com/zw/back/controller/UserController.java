package com.zw.back.controller;

import com.zw.back.po.User;
import com.zw.back.po.UserPage;
import com.zw.back.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;
    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/gologin")
    public String gologin(User user, HttpSession session, String remenber, HttpServletResponse response, Model model){
        if(user.getUsername()==null||"".equalsIgnoreCase(user.getUsername())){
            model.addAttribute("model","用户名不能为空");
            return "login";
        }
        System.out.println(remenber+"------------");
        System.out.println(user.getUsername()+"----------");
        System.out.println(user.getPassword()+"----------");
        User users =userService.login(user);
        System.out.println(users+"----------");
        if(users!=null){
            session.setAttribute("usersback",users);

            Cookie nameCookie = new Cookie("username1",user.getUsername());
            Cookie passCookie = new Cookie("password1",user.getPassword());

            if(remenber!=null){
                nameCookie.setMaxAge(60*60*24*7);
                passCookie.setMaxAge(60*60*24*7);
            }else{
                nameCookie.setMaxAge(0);
                passCookie.setMaxAge(0);
            }
            nameCookie.setPath("/");
            passCookie.setPath("/");

            response.addCookie(nameCookie);
            response.addCookie(passCookie);
            return "index";
        }else{
            model.addAttribute("model","用户名或密码错误");
            return "login";
        }
    }

    @RequestMapping("userlist")
    public String userlist(String uname,HttpServletRequest request,Model model){
        System.out.println(uname);
        Integer pagenow=1;
        if(request.getParameter("pagenow")!=null){
           pagenow=Integer.parseInt(request.getParameter("pagenow"));
        }
        System.out.println(pagenow);
        UserPage userPage=userService.getList(uname,pagenow);
        model.addAttribute("page",userPage);
        model.addAttribute("uname",uname);
        return "userlist";
    }

    @RequestMapping("index")
    public String index(){
        return "index";
    }

    @RequestMapping("ok")
    public String ok(){
        return "ok";
    }

    @RequestMapping("updata")
    public void updata(Integer uid,Integer statics,HttpServletResponse response) throws IOException {
        User user=new User();
        user.setUid(uid);
        user.setState(statics);
        userService.updata(user);
        response.getWriter().println("ok");
    }
}
