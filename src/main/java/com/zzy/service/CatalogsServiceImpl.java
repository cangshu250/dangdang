package com.zzy.service;

import com.zzy.dao.CatalogDao;
import com.zzy.entity.Catalog;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("catalogService")
public class CatalogsServiceImpl implements CatalogsService {
    @Resource
    private CatalogDao catalogDao;
    @Override
    public List<Catalog> findCatalogs() {
        return catalogDao.queryAllCatalog();
    }
}
