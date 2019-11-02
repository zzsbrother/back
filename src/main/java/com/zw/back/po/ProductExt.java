package com.zw.back.po;

import java.util.List;

public class ProductExt extends  Product{
    private Category category;
    private CategorySecond categorySecond;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public CategorySecond getCategorySecond() {
        return categorySecond;
    }

    public void setCategorySecond(CategorySecond categorySecond) {
        this.categorySecond = categorySecond;
    }
}
