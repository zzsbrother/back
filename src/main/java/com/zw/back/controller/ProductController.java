package com.zw.back.controller;

import com.zw.back.po.Category;
import com.zw.back.po.CategorySecond;
import com.zw.back.po.ProPage;
import com.zw.back.po.Product;
import com.zw.back.service.ICategoryService;
import com.zw.back.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    private IProductService productService;
    @Resource
    private ICategoryService categoryService;

    @RequestMapping("proList")
    public String prolist(Model model, HttpServletRequest request, Integer pagenow){
        Integer cid=0;
        Integer csid=0;
        if(request.getParameter("cid")!=null){
           cid=Integer.parseInt(request.getParameter("cid"));
        }
        if(request.getParameter("csid")!=null){
            csid=Integer.parseInt(request.getParameter("csid"));
        }
        System.out.println("cid="+cid);
        String pname=request.getParameter("pnames");
        System.out.println("Controller:productName="+pname);
        System.out.println("pname"+pname);
        System.out.println("pagenow"+pagenow);

        if(pagenow==null){
            pagenow=1;
        }
        ProPage proPage=productService.prolist(cid,csid,pname,pagenow);
        /*List<Product> productList= productService.prolist();*/
        List<Category> categoryList=categoryService.categoryList();
        List<CategorySecond> categorySecondList=categoryService.categorySecondList();
        System.out.println("ProductController:csid="+csid);
        model.addAttribute("page",proPage);
        model.addAttribute("cids",cid);
        model.addAttribute("csid",csid);
        model.addAttribute("pname",pname);
        model.addAttribute("categoryList",categoryList);
        model.addAttribute("categorySecondList",categorySecondList);
        return "prolist";
    }

}
