package com.zw.back.service.impl;

import com.zw.back.dao.IProductDao;
import com.zw.back.po.Paging;
import com.zw.back.po.ProPage;
import com.zw.back.po.Product;
import com.zw.back.po.ProductExt;
import com.zw.back.service.IProductService;
import com.zw.back.util.PageUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
@Transactional
public class ProductServiceImpl implements IProductService {
    @Resource
    private IProductDao productDao;
    @Resource
    private PageUtil pageUtil;

    @Override
    public ProPage prolist(Integer cid, Integer csid, String pname, Integer pagenow) {
        ProPage proPage=new ProPage();
        if(cid==-1){
            cid=0;
        }
        if(csid==-1){
            csid=0;
        }
        proPage.setCid(cid);
        proPage.setCsid(csid);
        proPage.setPname(pname);
        proPage.setPagenow(pagenow);
        proPage.setPagesize(15);
        proPage.setPageall((proPage.getPagenow()-1)*proPage.getPagesize());
        System.out.println("proPageALL:"+proPage.getPageall());
        List<ProductExt> productExtList=productDao.proList(proPage);
        proPage.setProductExtList(productExtList);
        proPage.setTotal(productDao.getProListNumber(proPage));
        System.out.println("proPageTotal:"+proPage.getTotal());
        Paging paging=pageUtil.getPaging(proPage);
        proPage.setPaging(paging);
        return proPage;
    }
}
