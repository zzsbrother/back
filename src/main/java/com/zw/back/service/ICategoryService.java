package com.zw.back.service;

import com.zw.back.po.CatePage;
import com.zw.back.po.Category;
import com.zw.back.po.CategoryExt;
import com.zw.back.po.CategorySecond;

import java.util.List;

public interface ICategoryService {
    List<Category> categoryList();
    List<CategorySecond> categorySecondList();
    List<CategorySecond> getCategorySecond(Integer cid);
    CatePage getCatePage(Integer pagenow);
    //添加，修改，删除二级类目
    void addCategorySecond(CategorySecond categorySecond);
    String updataCategorySecond(CategorySecond categorySecond);
    void delete(Integer csid);
    //添加，修改，删除yi级类目
    String addCategory(Category category);
    String updataCategory(CategoryExt categoryExt);
    void deleteCategoryOne(Integer cid);
}
