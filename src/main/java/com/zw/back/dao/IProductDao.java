package com.zw.back.dao;

import com.zw.back.po.ProPage;
import com.zw.back.po.Product;
import com.zw.back.po.ProductExt;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IProductDao {
    List<ProductExt> proList(ProPage proPage);
    Integer getProListNumber(ProPage proPage);
    void deleteProduct(Integer csid);
}
