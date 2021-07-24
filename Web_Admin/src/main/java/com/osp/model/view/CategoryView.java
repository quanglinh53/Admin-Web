package com.osp.model.view;

import com.osp.model.Category2;

import java.util.List;

public class CategoryView {
    private Category2 category;
    private List<Category2> lts;

    public Category2 getCategory() {
        return category;
    }

    public void setCategory(Category2 category) {
        this.category = category;
    }

    public List<Category2> getLts() {
        return lts;
    }

    public void setLts(List<Category2> lts) {
        this.lts = lts;
    }
}
