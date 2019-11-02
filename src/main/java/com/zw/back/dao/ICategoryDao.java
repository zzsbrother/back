package com.zw.back.dao;

import com.zw.back.po.CatePage;
import com.zw.back.po.Category;
import com.zw.back.po.CategoryExt;
import com.zw.back.po.CategorySecond;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ICategoryDao {
    List<Category> categoryList();
    List<CategorySecond> categorySecondList();
    List<CategorySecond> getCategorySecond(Integer cid);
    List<CategorySecond> getCatePage(CatePage catePage);
    Integer getCatePageNum(CatePage catePage);
    //添加，修改，删除二级类目
    void addCategorySecond(CategorySecond categorySecond);
    void updataCategorySecond(CategorySecond categorySecond);
    void delete(Integer csid);
    void deleteCategorySecond(Integer cid);
    //添加，修改，删除一级类目
    void addCategory(Category category);
    void updataCategory(CategoryExt categoryExt);
    void updataCategoryTwo(CategoryExt categoryExt);
    void updataCategoryByID(CategoryExt categoryExt);
    void deleteCategoryByID(Integer cid);
    List<Integer> getdeleteCategorySecond(Integer cid);
}
