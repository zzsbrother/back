package com.zw.back.controller;

import com.zw.back.po.Category;
import com.zw.back.po.CategoryExt;
import com.zw.back.po.CategorySecond;
import com.zw.back.service.ICategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestController
public class CategoryControllerReturn {

    @Resource
    private ICategoryService categoryService;

    @GetMapping("getCategorySecond")
    public List<CategorySecond> getCategorySecond(HttpServletRequest request) {
        Integer cids = Integer.parseInt(request.getParameter("cids"));
        System.out.println("cid:"+cids);
        if(cids==null){
            cids=-1;
        }
        List<CategorySecond> categorySecondList= categoryService.getCategorySecond(cids);
        for (CategorySecond c:categorySecondList) {
            System.out.println(c.getCsname());
        }/*
        StringBuffer sb = new StringBuffer();
        for (CategorySecond cs : categorySecondList) {
            sb.append(cs);
            sb.append(",");
            System.out.println(cs.getCsid());
        }
        //分割最后的逗号
        String result = sb.toString();
        result = result.substring(0,result.length()-1);
        response.getWriter().println(result);*/
        return categorySecondList;
    }

    //添加二级类目
    @RequestMapping("addCategorySecond")
    public String addCategorySecond(String csname, Integer cid, HttpServletResponse response){
        System.out.println("csname:"+csname);
        System.out.println("cid:"+cid);
        CategorySecond categorySecond = new CategorySecond();
        categorySecond.setCsname(csname);
        categorySecond.setCid(cid);
        List<CategorySecond> categorySecondList=categoryService.categorySecondList();
        for (CategorySecond cs:categorySecondList) {
            if(csname.equals(cs.getCsname())){
                return "类目名称重复，添加失败";
            }
        }
        categoryService.addCategorySecond(categorySecond);
        System.out.println("添加成功");
        return "添加成功";
    }

    //修改二级类目
    @RequestMapping("updataCategory")
    public String updataCategory(Integer csid, String CSecondName, Integer Cid){
        System.out.println("csid:"+csid);
        System.out.println("Cid:"+Cid);
        System.out.println("CSecondName:"+CSecondName);
        CategorySecond categorySecond=new CategorySecond();
        categorySecond.setCid(Cid);
        categorySecond.setCsname(CSecondName);
        categorySecond.setCsid(csid);
        String u=categoryService.updataCategorySecond(categorySecond);
        return u;
    }

    //添加一级类目
    @RequestMapping("addCategory")
    public String addCategory(String cname){
        System.out.println("cname:"+cname);
        Category category=new Category();
        category.setCname(cname);
        category.setOrder(100);
        String u=categoryService.addCategory(category);
        return u;
    }

    @RequestMapping("updataCategoryOne")
    public String updataCategoryOne(Integer order,Integer cid,String cname,Integer oldorder){
        CategoryExt categoryExt = new CategoryExt();
        categoryExt.setOrder(order);
        categoryExt.setCname(cname);
        categoryExt.setCid(cid);
        categoryExt.setOldorder(oldorder);
        String x=categoryService.updataCategory(categoryExt);
        return x;
    }

    @RequestMapping("deleteByCid")
    public void deleteByCid(Integer cid){
        categoryService.deleteCategoryOne(cid);
    }
}
