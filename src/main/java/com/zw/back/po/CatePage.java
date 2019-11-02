package com.zw.back.po;

import java.util.List;

public class CatePage extends PageSource {
    private List<CategorySecond> categorySecondList;

    public List<CategorySecond> getCategorySecondList() {
        return categorySecondList;
    }

    public void setCategorySecondList(List<CategorySecond> categorySecondList) {
        this.categorySecondList = categorySecondList;
    }
}
