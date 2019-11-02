package com.zw.back.service;

import com.zw.back.po.ProPage;
import com.zw.back.po.Product;
import com.zw.back.po.ProductExt;

import java.util.List;

public interface IProductService {
    ProPage prolist(Integer cid, Integer csid, String pname, Integer pagenow);
}
