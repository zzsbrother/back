package com.zw.back.controller;

import com.zw.back.po.CatePage;
import com.zw.back.po.Category;
import com.zw.back.po.CategorySecond;
import com.zw.back.service.ICategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Resource
    private ICategoryService categoryService;

    @RequestMapping("category")
    public String Category(Model model){
        List<Category> categoryList=categoryService.categoryList();
        model.addAttribute("categoryList",categoryList);
        return "category";
    }

    @RequestMapping("categorySecond")
    public String categorySecond(Model model,Integer pagenow){
        List<CategorySecond> categorySecondList=categoryService.categorySecondList();
        List<Category> categoryList=categoryService.categoryList();
        if(pagenow==null){
            pagenow=1;
        }
        CatePage catePage=categoryService.getCatePage(pagenow);
        model.addAttribute("page",catePage);
        model.addAttribute("categoryList",categoryList);
        return "categorySecond";
    }

    @RequestMapping("delete")
    public String delete(HttpServletRequest request){
        Integer csid=Integer.parseInt(request.getParameter("delete"));
        categoryService.delete(csid);
        Integer pp=Integer.parseInt( request.getParameter("pp"));
        request.setAttribute("pagenow",pp);
        return "forward:/category/categorySecond";
    }
}
