package com.zzy.dao;

import com.zzy.entity.Catalog;

import java.util.List;

public interface CatalogDao {
    public List<Catalog> queryAllCatalog();
    public Catalog queryCatalogById(String id);
}
