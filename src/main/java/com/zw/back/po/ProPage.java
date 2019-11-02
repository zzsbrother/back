package com.zw.back.po;

import java.util.List;

public class ProPage extends PageSource {
    private Integer cid;
    private Integer csid;
    private String pname;
    private List<ProductExt> productExtList;

    public List<ProductExt> getProductExtList() {
        return productExtList;
    }

    public void setProductExtList(List<ProductExt> productExtList) {
        this.productExtList = productExtList;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }
}
