package com.zw.back.service.impl;

import com.zw.back.dao.ICategoryDao;
import com.zw.back.dao.IProductDao;
import com.zw.back.po.*;
import com.zw.back.service.ICategoryService;
import com.zw.back.service.IProductService;
import com.zw.back.util.PageUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
@Transactional
public class CategoryServiceImpl implements ICategoryService {
    @Resource
    private ICategoryDao categoryDao;
    @Resource
    private IProductDao productDao;
    @Resource
    private PageUtil pageUtil;

    @Override
    public List<Category> categoryList() {
        return categoryDao.categoryList();
    }

    @Override
    public List<CategorySecond> categorySecondList() {
        return categoryDao.categorySecondList();
    }

    @Override
    public List<CategorySecond> getCategorySecond(Integer cid) {
        if(cid==-1){
            return categoryDao.categorySecondList();
        }
        return categoryDao.getCategorySecond(cid);
    }

    @Override
    public CatePage getCatePage(Integer pagenow) {
        CatePage catePage=new CatePage();
        catePage.setPagenow(pagenow);
        catePage.setPagesize(10);
        catePage.setPageall((catePage.getPagenow()-1)*catePage.getPagesize());
        catePage.setCategorySecondList(categoryDao.getCatePage(catePage));
        catePage.setTotal(categoryDao.getCatePageNum(catePage));
        Paging paging=pageUtil.getPaging(catePage);
        catePage.setPaging(paging);
        return catePage;
    }

    @Override
    public void addCategorySecond(CategorySecond categorySecond) {
        categoryDao.addCategorySecond(categorySecond);
    }

    @Override
    public String updataCategorySecond(CategorySecond categorySecond) {
        List<CategorySecond> list=categoryDao.categorySecondList();
        for (CategorySecond cs:list) {
            if(cs.getCsid()!=categorySecond.getCsid() && cs.getCsname().equals(categorySecond.getCsname())){
                return "修改名称重复，请重新更改";
            }
        }
        categoryDao.updataCategorySecond(categorySecond);
        return "修改成功";
    }

    @Override
    public void delete(Integer csid) {
        categoryDao.delete(csid);
        productDao.deleteProduct(csid);
    }

    @Override
    public String addCategory(Category category) {
        List<Category> list=categoryDao.categoryList();
        for (Category c:list) {
            if(c.getCname().equals(category.getCname())){
                return "名字重复，添加失败";
            }
        }
        categoryDao.addCategory(category);
        return "添加成功";
    }

    @Override
    public String updataCategory(CategoryExt categoryExt) {
        List<Category> list=categoryDao.categoryList();
        for (Category c:list) {
            if(c.getCid()!=categoryExt.getCid() && c.getCname().equals(categoryExt.getCname())){
                return "名字重复，修改失败";
            }
        }
        Integer order=categoryExt.getOrder();
        Integer oldorder=categoryExt.getOldorder();
        Integer t=-1;

        if(order==oldorder){
            categoryDao.updataCategoryByID(categoryExt);
        }else{
            categoryExt.setOrder(t);
            categoryDao.updataCategory(categoryExt);

            categoryExt.setOrder(oldorder);
            categoryExt.setOldorder(order);
            categoryDao.updataCategoryTwo(categoryExt);

            categoryExt.setOrder(order);
            categoryExt.setOldorder(t);
            categoryDao.updataCategoryTwo(categoryExt);
        }
        return "修改成功";
    }

    @Override
    public void deleteCategoryOne(Integer cid) {
        List<Integer> cslist=categoryDao.getdeleteCategorySecond(cid);
        for (Integer cs:cslist) {
            productDao.deleteProduct(cs);
        }
        categoryDao.deleteCategorySecond(cid);
        categoryDao.deleteCategoryByID(cid);
    }


}
